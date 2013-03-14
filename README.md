### README


Password generator through a simple wordlist.
You can use this tool to create a **new wordlist** with **numbers** and **special characters**.

### USAGE

You must to configure the parameters of the file <a href="https://github.com/guelfoweb/passgen/blob/master/passgen.cfg">passgen.cfg</a><br />
Start passgen with:
<pre>
./passgen.sh
</pre>
or
<pre>
./passgen.sh -i [file input] -o [file output]
</pre>
<pre>
[+] Ready for 211360 passwords
[+] Password format: wns
[+] Password Type: Achille0!
[+] File output: output.txt

Press [Enter] key to start or [Ctrl+C] key to stop...

Started: gio 14 mar 2013, 20.14.19, CET
Stopped: gio 14 mar 2013, 20.14.52, CET
</pre>
<pre>
cat output.txt
</pre>
<pre>
Adam1970!
Adam1970@
Adam1970$
Adam1970%
::
Adam2013!
Adam2013@
Adam2013$
Adam2013%
::
Zuckerberg1970!
Zuckerberg1970@
Zuckerberg1970$
Zuckerberg1970%
::
Zuckerberg2013!
Zuckerberg2013@
Zuckerberg2013$
Zuckerberg2013%
</pre>


### FORMAT TYPE
<pre>
wns -> Word + Number + Special Char -> password0!
wsn -> Word + Special Char + Number -> password!0
nws -> Number + Word + Special Char -> 0password!
nsw -> Number + Special Char + Word -> 0!password
snw -> Special Char + Number + Word -> !0password
swn -> Special Char + Word + Number -> !password0
</pre>

### OTHER

This script is currently maintained by Gianni 'guelfoweb' Amato, who can be contacted at guelfoweb@gmail.com. Suggestions and criticism are welcome.

Enjoy!
