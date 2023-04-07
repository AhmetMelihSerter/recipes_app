import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:recipes_app/core/init/navigation/i_navigation_service.dart';
import 'package:recipes_app/product/init/navigation/navigation_router.dart';

@Singleton(as: INavigationService)
class AutoRouterManager extends INavigationService {
  final appRouter = NavigationRouter();

  String get _sessionExpired =>
      'Oturum Süresi Doldu. Lütfen Tekrar Giriş Yapınız.';

  @override
  GlobalKey<NavigatorState> get navigatorKey => appRouter.navigatorKey;

  @override
  Future<void> navigateToNamed({
    required String path,
    Object? data,
  }) async {
    await appRouter.pushNamed(path);
  }

  @override
  Future<void> navigateToPage<T extends Object>({
    required T route,
    Object? data,
  }) async {
    await appRouter.push(route as PageRouteInfo);
  }

  @override
  Future<void> navigateToPageClear<T extends Object>({
    required T route,
    Object? data,
  }) async {
    await replaceAll(routes: [route as PageRouteInfo]);
  }

  @override
  Future<void> navigateHome<T extends Object>({List<T>? routes}) async {
    await appRouter.replaceAll([
      const HomeRoute(),
      ...?routes as List<PageRouteInfo>?,
    ]);
  }

  @override
  Future<void> replaceAll<T extends Object>({required List<T> routes}) async {
    await appRouter.replaceAll(routes as List<PageRouteInfo>);
  }

  @override
  Future<void> pushAll<T extends Object>({required List<T> routes}) async {
    await appRouter.pushAll(routes as List<PageRouteInfo>);
  }

  @override
  void pop() {
    appRouter.pop();
  }

  @override
  void unAuthorized() {
    replaceAll(
      routes: [
        const SplashRoute(),
      ],
    );
  }

  @override
  RouterDelegate<Object>? routerDelegate({
    List<NavigatorObserver>? navigatorObservers,
  }) {
    return appRouter.delegate(
      navigatorObservers: () => navigatorObservers ?? [],
    );
  }

  @override
  RouteInformationParser<Object>? routeInformationParser() {
    return appRouter.defaultRouteParser();
  }
}
