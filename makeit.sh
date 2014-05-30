#!/bin/bash
if [ -d extract ]; then
  echo "Cleaning up: remove dir extract"
  rm -rf extract
fi
if [ -d mygapps ]; then
  echo "Cleaning up: remove dir mygapps"
  rm -rf mygapps
fi
mkdir mygapps
mkdir extract
cd tools
echo "Now configuring your GAPPS...."
echo "ui_print(\" \");" > updater-script
echo "ui_print(\"Make your own GAPPS\");" >> updater-script
echo "ui_print(\" \");" >> updater-script
echo "ui_print(\"   by N.Wilms\");" >> updater-script
echo "ui_print(\"Mounting system...\");" >> updater-script
echo "run_program(\"/sbin/busybox\", \"mount\", \"/system\");" >> updater-script
echo "show_progress(10, 10);" >> updater-script
echo "I can delete the old GAPPS from your ROM."
echo "For Details look at "tools/deloldgapps.txt""
echo "If you have anything more to delete place it there!"
echo
echo -n "Delete old GAPPS from existing ROM [y/n]?:"
read delOLD 
if [ $delOLD == "y" ]; then
 cat deloldgapps.txt >> updater-script
fi
echo "show_progress(10, 10);" >> updater-script
cat instgapps.txt >> updater-script
echo "Now extracting ....."
7z x -o../extract ../*.zip META-INF/CERT.RSA > output.txt
7z x -o../extract ../*.zip META-INF/CERT.SF >> output.txt
7z x -o../extract ../*.zip META-INF/MANIFEST.MF >> output.txt
7z x -o../extract ../*.zip META-INF/com/google/android/update-binary >> output.txt
7z x -o../extract ../*.zip system/app/GoogleContactsSyncAdapter.apk >> output.txt
7z x -o../extract ../*.zip system/etc/permissions/com.google.android.maps.xml >> output.txt
7z x -o../extract ../*.zip system/etc/permissions/com.google.android.media.effects.xml >> output.txt
7z x -o../extract ../*.zip system/etc/permissions/com.google.widevine.software.drm.xml >> output.txt
7z x -o../extract ../*.zip system/etc\permissions\features.xml >> output.txt
7z x -o../extract ../*.zip system/framework/com.google.android.maps.jar >> output.txt
7z x -o../extract ../*.zip system/framework/com.google.android.media.effects.jar >> output.txt
7z x -o../extract ../*.zip system/framework/com.google.widevine.software.drm.jar >> output.txt
7z x -o../extract ../*.zip system/priv-app/CalendarProvider.apk >> output.txt
7z x -o../extract ../*.zip system/priv-app/GoogleBackupTransport.apk >> output.txt
7z x -o../extract ../*.zip system/priv-app/GoogleFeedback.apk >> output.txt
7z x -o../extract ../*.zip system/priv-app/GoogleLoginService.apk >> output.txt
7z x -o../extract ../*.zip system/priv-app/GooglePartnerSetup.apk >> output.txt
7z x -o../extract ../*.zip system/priv-app/GoogleServicesFramework.apk >> output.txt
7z x -o../extract ../*.zip system/priv-app/Phonesky.apk  >> output.txt
7z x -o../extract ../*.zip system/priv-app/PrebuiltGmsCore.apk >> output.txt
7z x -o../extract ../*.zip system/priv-app/SetupWizard.apk >> output.txt
mv updater-script ../extract/META-INF/com/google/android  >> output.txt
echo "if you would like to add some APKs?"
echo "Copy them to the right place in the "extract" dir."
echo "Or change something else?"
echo "Now its the time!"
echo
echo "Press any key to continue"
read -n 1 -s
echo "Zipping"
7z a -tzip ../mygapps_unsigned.zip ../extract/* -mx
echo "Signing"
java -Xmx512m -jar signapk.jar -w testkey.x509.pem testkey.pk8 ../mygapps_unsigned.zip ../mygapps/mygapps.zip
cd ..
rm mygapps_unsigned.zip
echo "Press any key to continue"
read -n 1 -s
