if [[ $1 != "" && $1 == "fvm" ]]
then
fvm flutter clean && fvm flutter pub get
else
flutter clean && flutter pub get
fi