#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "../slstatus.h"
#include "../util.h"

#define MULLVAD_STAT_CMD "mullvad status"

static const char *get_relay() {
  FILE *fp;
  char buff[0x80];
  static char relay[0x80];

  fp = popen("mullvad status", "r");
  if (fp == NULL) {
    perror("popen");
    return NULL;
  }
  while (fgets(buff, sizeof(buff), fp) != NULL) {
    if (strstr(buff, "Relay")) {
      if (sscanf(buff, "Relay: %s", relay) == 1) {
        fclose(fp);
        return relay;
      }
    }
  }
  pclose(fp);
  return NULL;
}

const char *mullvad_relay(const char *stat) {
  static char rtrelay[0x80];
  const char *relay = get_relay();

  if (relay != NULL) {
    snprintf(rtrelay, sizeof(rtrelay), "%s", relay);
  } else {
    snprintf(rtrelay, sizeof(rtrelay), "No Relay");
  }

  return rtrelay;
}

