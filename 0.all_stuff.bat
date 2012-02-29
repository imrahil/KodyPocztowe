cls
call "%FLEX4_HOME%\bin\mxmlc.exe" +configname=airmobile -library-path+=libs -output bin-release\KodyPocztowe.swf src\KodyPocztowe.mxml
call "%PLAYBOOK_HOME%\bin\blackberry-airpackager.bat" -devMode -debugToken debugtoken_imrahil.bar -package "bin-release\KodyPocztowe.bar" src\KodyPocztowe-app.xml -C bin-release bin-release\KodyPocztowe.swf -C src src\blackberry-tablet.xml src\KodyPocztowe-icon.png -e src\data\kody_pocztowe.sqlite data/kody_pocztowe.sqlite -installApp -launchApp -password jarek -device 192.168.1.10
