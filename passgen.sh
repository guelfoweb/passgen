#!/bin/bash

## Password generator with wordlist 
## passgen.sh v.0.1
## by Gianni 'guelfoweb' Amato

#
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# guelfoweb@gmail.com wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return Gianni 'guelfoweb' Amato
# ----------------------------------------------------------------------------
#

CONFIG="passgen.cfg"

wordlist=`grep "^wordlist=" $CONFIG | cut -d"=" -f2`
chars=`grep "^chars=" $CONFIG | cut -d"=" -f2`
u=`grep "^u=" $CONFIG | cut -d"=" -f2`
nstart=`grep "^nstart=" $CONFIG | cut -d"=" -f2`
nend=`grep "^nend=" $CONFIG | cut -d"=" -f2`
specialchar=(`grep "^specialchar\[[0-9]*\]=" $CONFIG | cut -d"=" -f2`)
format=`grep "^format=" $CONFIG | cut -d"=" -f2`


nelements=`grep -v "à\|è\|é\|ì\|ò\|ù\|'" "$wordlist" | wc -l | cut -d " " -f1 | sed 's/ //'`
nspecials=`grep -c "^specialchar\[[0-9]*\]=" $CONFIG`

echo "[+] Ready for $(( $nelements * $nspecials * $nend )) passwords"

if $u; then u="."; else u="^"; fi
echo "[+] Password format: $format"
echo -n "[+] Password Type: "
case $format in
  wns) head -n1 "$wordlist" | sed "s/\b\($u\)/\u\1/" | sed "s/$/$nstart/" | sed "s/$/$specialchar/" ;;
	wsn) head -n1 "$wordlist" | sed "s/\b\($u\)/\u\1/" | sed "s/$/$specialchar/" | sed "s/$/$nstart/" ;;
	nws) head -n1 "$wordlist" | sed "s/\b\($u\)/\u\1/" | sed "s/^/$nstart/" | sed "s/$/$specialchar/" ;;
	swn) head -n1 "$wordlist" | sed "s/\b\($u\)/\u\1/" | sed "s/$/$nstart/" | sed "s/^/$specialchar/" ;;
	nsw) head -n1 "$wordlist" | sed "s/\b\($u\)/\u\1/" | sed "s/^/$specialchar/" | sed "s/^/$nstart/" ;;
	snw) head -n1 "$wordlist" | sed "s/\b\($u\)/\u\1/" | sed "s/^/$nstart/" | sed "s/^/$specialchar/" ;;
	*) echo "error.."
	exit
esac

echo
read -p "Press [Enter] key to start or [Ctrl+C] key to stop..."
echo

grep "^.\{$chars\}$" "$wordlist" | grep -v "à\|è\|é\|ì\|ò\|ù\|'" | sed "s/\b\($u\)/\u\1/" | sort | while read word;
	do {
		for n in $(seq $nstart $nend)
		do
			for s in "${specialchar[@]}"
			do
				case $format in
					wns) echo $word | sed "s/$/$n/" | sed "s/$/$s/" ;;
					wsn) echo $word | sed "s/$/$s/" | sed "s/$/$n/" ;;
					nws) echo $word | sed "s/^/$n/" | sed "s/$/$s/" ;;
					swn) echo $word | sed "s/$/$n/" | sed "s/^/$s/" ;;
					nsw) echo $word | sed "s/^/$s/" | sed "s/^/$n/" ;;
					snw) echo $word | sed "s/^/$n/" | sed "s/^/$s/" ;;
					*) echo "error.."
					exit
				esac
			done
		done
	}
	done
