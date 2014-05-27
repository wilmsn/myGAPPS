myGAPPS
=======

myGAPPS: create your own GAPPS for KitKat: small or big as you like it  
By default you will create very small GAPPS (only 16MB)!

The scripts will run on WINDOWS.
This repository contains only the basic scripts.
You have to load some additional software:

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
===========
1) Download my scripts https://github.com/wilmsn/myGAPPS/archive/master.zip and extract them at a place on your choice on your computer, called <myGAPPS> later.
2) Goto <myGAPPS>\tools
3) Extract dos2unix here
4) Extract 7za442.zip here
5) Extract here this files from the sign archive: signapk.jar, testkey.pk8, testkey.x509.pem
6) Make sure you have installed java runtime on your computer 

Creating a GAPPS version:
=========================
1) Download you favorite GAPPS as installable zip file
2) Place it in <myGAPPS>
3) Start makeit.bat
4) You will find the result in <myGAPPS>\myGAPPS

Change the content of your GAPPS:
=================================
Inside the tools dir you will find 2 scripts:
deloldgapps.txt: Put anything in here what you would like the script to delete
This will only be included if you answer "Delete old GAPPS from existing ROM [y/n]?" with y
instgapps.txt: Change it the way you like it
This will allways be included





