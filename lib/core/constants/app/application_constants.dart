// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/foundation.dart';

import 'package:recipes_app/core/constants/enums/app_enum.dart';

class ApplicationConstants {
  ApplicationConstants._();

  static const String APP_NAME = 'Recipes APP';

  static AppMode get APP_MODE => kDebugMode ? AppMode.debug : AppMode.release;
}
