@echo off
rd /s /q extract
rd /s /q mygapps
md extract
md mygapps
cd tools
echo Now configuring your GAPPS....
echo ui_print(" "); > updater-script
echo ui_print("Make your own GAPPS"); >> updater-script
echo ui_print(" "); >> updater-script
echo ui_print("   by N.Wilms"); >> updater-script
echo ui_print("Mounting system..."); >> updater-script
echo run_program("/sbin/busybox", "mount", "/system"); >> updater-script
echo show_progress(10, 10); >> updater-script
echo I can delete the old GAPPS from your ROM.
echo For Details look at "tools/deloldgapps.txt"
echo If you have anything more to delete place it there!
set /p delOLD=Delete old GAPPS from existing ROM [y/n]?: 
if "%delOLD%"=="y" (
type deloldgapps.txt >> updater-script
)
echo show_progress(10, 10); >> updater-script
type instgapps.txt >> updater-script
echo Now extracting .....
7za.exe x -o..\extract ..\*.zip META-INF\CERT.RSA > output.txt
7za.exe x -o..\extract ..\*.zip META-INF\CERT.SF >> output.txt
7za.exe x -o..\extract ..\*.zip META-INF\MANIFEST.MF >> output.txt
7za.exe x -o..\extract ..\*.zip META-INF\com\google\android\update-binary >> output.txt
rem 7za.exe x -o..\extract ..\*.zip system\addon.d\*gapps.sh >> output.txt
7za.exe x -o..\extract ..\*.zip system\app\GoogleContactsSyncAdapter.apk >> output.txt
7za.exe x -o..\extract ..\*.zip system\etc\permissions\com.google.android.maps.xml >> output.txt
7za.exe x -o..\extract ..\*.zip system\etc\permissions\com.google.android.media.effects.xml >> output.txt
7za.exe x -o..\extract ..\*.zip system\etc\permissions\com.google.widevine.software.drm.xml >> output.txt
7za.exe x -o..\extract ..\*.zip system\etc\permissions\features.xml >> output.txt
7za.exe x -o..\extract ..\*.zip system\framework\com.google.android.maps.jar >> output.txt
7za.exe x -o..\extract ..\*.zip system\framework\com.google.android.media.effects.jar >> output.txt
7za.exe x -o..\extract ..\*.zip system\framework\com.google.widevine.software.drm.jar >> output.txt
7za.exe x -o..\extract ..\*.zip system\priv-app\CalendarProvider.apk >> output.txt
7za.exe x -o..\extract ..\*.zip system\priv-app\GoogleBackupTransport.apk >> output.txt
7za.exe x -o..\extract ..\*.zip system\priv-app\GoogleFeedback.apk >> output.txt
7za.exe x -o..\extract ..\*.zip system\priv-app\GoogleLoginService.apk >> output.txt
7za.exe x -o..\extract ..\*.zip system\priv-app\GooglePartnerSetup.apk >> output.txt
7za.exe x -o..\extract ..\*.zip system\priv-app\GoogleServicesFramework.apk >> output.txt
7za.exe x -o..\extract ..\*.zip system\priv-app\Phonesky.apk  >> output.txt
7za.exe x -o..\extract ..\*.zip system\priv-app\PrebuiltGmsCore.apk >> output.txt
7za.exe x -o..\extract ..\*.zip system\priv-app\SetupWizard.apk >> output.txt
dos2unix updater-script
move updater-script ..\extract\META-INF\com\google\android  >> output.txt
echo If you would like to add some APKs?
echo Copy them to the right place in the "extract" dir.
echo Or change something else?
echo Now its the time!
pause
echo Zipping
7za a -tzip "../updateold.zip" "../extract/*" -mx
echo Signing
java -Xmx512m -jar signapk.jar -w testkey.x509.pem testkey.pk8 ../updateold.zip ../mygapps/mygapps.zip
cd ..
del updateold.zip
rd /s /q extract
pause


