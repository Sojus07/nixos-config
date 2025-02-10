#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "../slstatus.h"
#include "../util.h"

#define MULLVAD_STAT_CMD "mullvad status"

static int
mullvad_conn()
{
    FILE *fp;
    char buff[0x80];
    int conn = 0;

    fp = popen(MULLVAD_STAT_CMD, "r");
    if (fp == NULL)
    {
        perror("popen");
        return -1;
    }

    while (fgets(buff, sizeof(buff), fp) != NULL)
    {
        if (strstr(buff, "Connected") != NULL)
        {
            conn = 1;
        }
    }
    pclose(fp);
    return conn;
}

const char *mullvad_stat(const char *stat) 
{
    static char status[128];
    if (mullvad_conn())
    {
        snprintf(status, sizeof(status), "CNTD");
    } else {
        snprintf(status, sizeof(status), "NOT CNTD");
    }
    return status;
}

// this shit sucks more
