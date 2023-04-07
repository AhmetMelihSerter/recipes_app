import 'package:recipes_app/core/base/model/base_model.dart';
import 'package:uuid/uuid.dart';

abstract class BaseStorageModel<T> extends BaseModel<T> {
  BaseStorageModel({String? identity})
      : _identity = identity ?? const Uuid().v4();

  String get tableName;
  final String _identity;

  String get identity => _identity;
}
