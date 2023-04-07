import 'package:recipes_app/core/base/model/base_storage_model.dart';

abstract class BaseAuthModel<T> extends BaseStorageModel<T> {
  BaseAuthModel({super.identity});
  String get token;
}
