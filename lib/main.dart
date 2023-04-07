import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:recipes_app/core/constants/app/application_constants.dart';
import 'package:recipes_app/core/init/navigation/i_navigation_service.dart';
import 'package:recipes_app/core/init/theme/i_theme_manager.dart';
import 'package:recipes_app/product/init/locale/locale_manager.dart';
import 'package:recipes_app/product/init/startup/startup_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StartupManager.initialize();

  runApp(
    EasyLocalization(
      path: getIt<LocaleManager>().path,
      supportedLocales: getIt<LocaleManager>().supportedLocales,
      fallbackLocale: getIt<LocaleManager>().enLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: ApplicationConstants.APP_NAME,
        theme: getIt<IThemeManager>().getTheme,
        routerDelegate: getIt<INavigationService>().routerDelegate(),
        routeInformationParser:
            getIt<INavigationService>().routeInformationParser(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
