// ignore_for_file: inference_failure_on_function_invocation

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:recipes_app/core/base/model/base_model.dart';
import 'package:recipes_app/core/constants/enums/app_enum.dart';
import 'package:recipes_app/core/init/network/i_network_manager.dart';
import 'package:recipes_app/product/constants/product/product_constants.dart';

@Singleton(as: INetworkManager)
class DioManager extends INetworkManager {
  DioManager(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  final _dio = Dio(
    BaseOptions(
      baseUrl: ProductConstants.BASE_URL,
      queryParameters: {
        'app_id': ProductConstants.API_ID,
        'app_key': ProductConstants.API_KEY,
      },
    ),
  );

  @override
  void addBaseHeader(MapEntry<String, String> mapEntry) {
    _dio.options.headers[mapEntry.key] = mapEntry.value;
  }

  @override
  void clearHeader() {
    _dio.options.headers.clear();
  }

  @override
  Future<T?> send<T extends BaseModel<T>>(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    RequestType requestType = RequestType.GET,
    required T parseModel,
  }) async {
    Response<dynamic> response;
    final bodyModel = _getBodyModel(data);
    if (requestType == RequestType.GET) {
      response = await _requestGet(path, queryParameters);
    } else if (requestType == RequestType.POST) {
      response = await _requestPost(path, queryParameters, bodyModel);
    } else if (requestType == RequestType.PUT) {
      response = await _requestPut(path, queryParameters, bodyModel);
    } else if (requestType == RequestType.PATCH) {
      response = await _requestPatch(path, queryParameters, bodyModel);
    } else {
      response = await _requestDelete(path, queryParameters, bodyModel);
    }
    if (response.data is Map<String, dynamic>) {
      return parseModel.fromJson(response.data as Map<String, dynamic>);
    }
    return null;
  }

  dynamic _getBodyModel(dynamic data) {
    if (data is BaseModel) {
      return data.toJson();
    } else if (data != null) {
      return jsonEncode(data);
    }
    return data;
  }

  Future<Response<dynamic>> _requestGet(
    String path,
    Map<String, dynamic>? queryParameters,
  ) async {
    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response<dynamic>> _requestPost(
    String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  ) async {
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response<dynamic>> _requestPut(
    String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  ) async {
    final response = await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response<dynamic>> _requestPatch(
    String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  ) async {
    final response = await _dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response<dynamic>> _requestDelete(
    String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  ) async {
    final response = await _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }
}
