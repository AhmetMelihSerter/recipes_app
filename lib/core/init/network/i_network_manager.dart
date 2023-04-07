import 'package:recipes_app/core/base/model/base_model.dart';
import 'package:recipes_app/core/constants/enums/app_enum.dart';

abstract class INetworkManager {
  void addBaseHeader(MapEntry<String, String> mapEntry);
  void clearHeader();
  Future<T?> send<T extends BaseModel<T>>(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    RequestType requestType = RequestType.GET,
    required T parseModel,
  });
}
