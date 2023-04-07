if [[ $1 != "" && $1 == "fvm" ]]
then
fvm flutter pub run easy_localization:generate -O lib/product/constants/locale -f keys -o locale_keys.g.dart --source-dir assets/translations
else
flutter pub run easy_localization:generate -O lib/product/constants/locale -f keys -o locale_keys.g.dart --source-dir assets/translations
fi