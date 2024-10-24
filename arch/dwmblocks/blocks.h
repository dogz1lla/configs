//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "printf %s%s%s%s \"^c#1FEA00^\" \"\uf1c0 \" $(free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g) \"^d^\"",	30,		0},
	{"", "printf %s%s%s%s \"^c#FFD900^\" \"\uf073 \" $(date '+%b %d (%a)') \"^d^\"",					5,		0},
	{"", "printf %s%s%s%s \"^c#FFFC72^\" \"\uf017 \" $(date '+%I:%M%p') \"^d^ \"",					5,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
