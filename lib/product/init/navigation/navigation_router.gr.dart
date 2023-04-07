// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'navigation_router.dart';

class _$NavigationRouter extends RootStackRouter {
  _$NavigationRouter([GlobalKey<NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    RecipesDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RecipesDetailRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: RecipesDetailView(
          key: args.key,
          args: args.args,
        ),
      );
    },
    RecipesSourceRoute.name: (routeData) {
      final args = routeData.argsAs<RecipesSourceRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: RecipesSourceView(
          key: args.key,
          args: args.args,
        ),
      );
    },
    RecipesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RecipesView(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FavoritesView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home-view',
          children: [
            RouteConfig(
              RecipesRoute.name,
              path: 'recipes-view',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              FavoritesRoute.name,
              path: 'favorites-view',
              parent: HomeRoute.name,
            ),
          ],
        ),
        RouteConfig(
          RecipesDetailRoute.name,
          path: '/recipes-detail-view',
        ),
        RouteConfig(
          RecipesSourceRoute.name,
          path: '/recipes-source-view',
        ),
      ];
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/home-view',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [RecipesDetailView]
class RecipesDetailRoute extends PageRouteInfo<RecipesDetailRouteArgs> {
  RecipesDetailRoute({
    Key? key,
    required RecipeModel args,
  }) : super(
          RecipesDetailRoute.name,
          path: '/recipes-detail-view',
          args: RecipesDetailRouteArgs(
            key: key,
            args: args,
          ),
        );

  static const String name = 'RecipesDetailRoute';
}

class RecipesDetailRouteArgs {
  const RecipesDetailRouteArgs({
    this.key,
    required this.args,
  });

  final Key? key;

  final RecipeModel args;

  @override
  String toString() {
    return 'RecipesDetailRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [RecipesSourceView]
class RecipesSourceRoute extends PageRouteInfo<RecipesSourceRouteArgs> {
  RecipesSourceRoute({
    Key? key,
    required RecipesSourceArgs args,
  }) : super(
          RecipesSourceRoute.name,
          path: '/recipes-source-view',
          args: RecipesSourceRouteArgs(
            key: key,
            args: args,
          ),
        );

  static const String name = 'RecipesSourceRoute';
}

class RecipesSourceRouteArgs {
  const RecipesSourceRouteArgs({
    this.key,
    required this.args,
  });

  final Key? key;

  final RecipesSourceArgs args;

  @override
  String toString() {
    return 'RecipesSourceRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [RecipesView]
class RecipesRoute extends PageRouteInfo<void> {
  const RecipesRoute()
      : super(
          RecipesRoute.name,
          path: 'recipes-view',
        );

  static const String name = 'RecipesRoute';
}

/// generated route for
/// [FavoritesView]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute()
      : super(
          FavoritesRoute.name,
          path: 'favorites-view',
        );

  static const String name = 'FavoritesRoute';
}
