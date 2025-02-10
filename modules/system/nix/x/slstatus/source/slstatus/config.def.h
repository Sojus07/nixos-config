const unsigned int interval = 1000;
static const char unknown_str[] = "?";

#define MAXLEN 2048

#define IFACE "enp6s0"
#define BAT "BAT1"

static const struct arg args[] = {
	{ netspeed_rx, " [ %sB/s]", IFACE }, 
	{ netspeed_tx, " [ %sB/s]", IFACE },
	{ ipv4, " ^c#fb4934^[ %s]", IFACE },
	{ run_command, " ^c#fb4934^[%s]", "sh /opt/suckless/slstatus/components/wg.sh" },
  { mullvad_relay, " [%s]", NULL },
  { mullvad_stat,  " [%s]", NULL },
  
	//{ battery_perc,  " ^c#fe9019^[ %s%%",  BAT },
	//{ battery_remaining," %s]",      	BAT },
    	
	//{ run_command,   " ^c#8ec07c^[ %s]",     "amixer sget Master | awk -F\"[][]\" '/%/ { print $2 }' | head -n1" },
	{ vol_perc, " ^c#8ec07c^[ %s]", NULL },
	{ cpu_perc,      " ^c#b8bb26^[%s%%]",  NULL },
	{ ram_used,      " ^c#d3869b^[  %s]",  NULL },
	{ datetime,      " ^c#ebdbb2^[ %s]", "%H:%M:%S" },
};

