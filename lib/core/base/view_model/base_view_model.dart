import 'package:flutter/material.dart';
import 'package:recipes_app/core/init/logger/i_logger_manager.dart';
import 'package:recipes_app/core/init/navigation/i_navigation_service.dart';

import 'package:recipes_app/product/init/startup/startup_manager.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BaseViewModel() {
    logger.info('$runtimeType initialize');
  }

  late final BuildContext viewModelContext;

  ILoggerManager get logger => getIt<ILoggerManager>();

  INavigationService get navigationService => getIt<INavigationService>();

  String get serviceNullText =>
      'Bir Hata Oluştu. Lütfen Daha Sonra Tekrar Deneyiniz.';

  void setContext(BuildContext context);
  void init();

  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void onExit() {}
}
