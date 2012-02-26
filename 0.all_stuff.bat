cls
call "c:\Dev\Flex_SDK\blackberry-tablet-sdk-2.0.0\bin\amxmlc.bat" -debug=false -library-path+=libs -output bin-release\KodyPocztowe.swf src\KodyPocztowe.mxml
call "c:\Dev\Flex_SDK\blackberry-tablet-sdk-2.0.0\bin\blackberry-airpackager.bat" -devMode -debugToken debugtoken_imrahil.bar -package "bin-release\KodyPocztowe.bar" src\KodyPocztowe-app.xml -C bin-release bin-release\KodyPocztowe.swf -C src src\blackberry-tablet.xml -e src\data\kody_pocztowe.sqlite data/kody_pocztowe.sqlite
