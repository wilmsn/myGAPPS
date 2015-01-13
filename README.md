myGAPPS
=======

myGAPPS: create your own GAPPS for KitKat: small or big as you like it  
By default you will create very small GAPPS (only 16MB)!

The script "makeit.bat" will run on WINDOWS, "makeit.sh" will run on Linux.
This repository contains only the basic scripts.
The following software is included for easy usage:

dos2unix
-------- 
Get it from here: http://waterlan.home.xs4all.nl/dos2unix.html

sign
----
Get it from here: https://github.com/appium/sign/archive/master.zip

7za.exe
-------
Get it from here: http://heanet.dl.sourceforge.net/project/sevenzip/7-Zip/4.42/7za442.zip

Installing:
-----------
1) Download my scripts https://github.com/wilmsn/myGAPPS/archive/master.zip and extract them at a place on your choice on your computer, called &lt;myGAPPS&gt; later.<br>
2) Goto &lt;myGAPPS&gt;\tools<br>
3) Extract dos2unix here<br>
4) Extract 7za442.zip here<br>
5) Extract here this files from the sign archive: signapk.jar, testkey.pk8, testkey.x509.pem<br>
6) Make sure you have installed java runtime on your computer <br>

Creating a GAPPS version:
-------------------------
1) Download you favorite GAPPS as installable zip file<br>
2) Place it in &lt;myGAPPS&gt;<br>
3) Start makeit.bat<br>
4) You will find the result in <myGAPPS>\myGAPPS<br>

Change the content of your GAPPS:
---------------------------------
Inside the tools dir you will find 2 scripts:<br>
deloldgapps.txt: Put anything in here what you would like the script to delete<br>
This will only be included if you answer "Delete old GAPPS from existing ROM [y/n]?" with y<br>
instgapps.txt: Change it the way you like it<br>
This will allways be included<br>

Tested with:
------------
Samsung Galaxy S plus running CM 11 by ADC Team<br>
Nexus 7 (grouper) running SlimROMs CM 11



