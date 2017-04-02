PWD=$(shell pwd)

examples: usage.out

usage.transcript: usage.sh
	gsc --config usage.sh.gscrc --interactive 0 --pause 5 usage.sh

usage.out: usage.transcript Makefile
	cat usage.transcript | sed -n '1,/\$ mkdir testing/ d; /\$ exit/,$$ d; s/shell.s/shells/; s|$(PWD)|/home/user/project|g; p' | vt100-scrub > usage.out
