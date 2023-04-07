// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductConstants {
  ProductConstants._();

  static String get BASE_URL => dotenv.get('BASE_URL');

  static String get API_ID => dotenv.get('API_ID');

  static String get API_KEY => dotenv.get('API_KEY');

  static String get SECURE_KEY => dotenv.get('SECURE_KEY');
}
