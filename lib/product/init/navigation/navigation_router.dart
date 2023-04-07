import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/feature/_model/recipe_model.dart';
import 'package:recipes_app/feature/favorites/view/favorites_view.dart';
import 'package:recipes_app/feature/home/view/home_view.dart';
import 'package:recipes_app/feature/recipes/recipes_detail/view/recipes_detail_view.dart';
import 'package:recipes_app/feature/recipes/recipes_source/model/recipes_source_args.dart';
import 'package:recipes_app/feature/recipes/recipes_source/view/recipes_source_view.dart';
import 'package:recipes_app/feature/recipes/recipes_sub/view/recipes_view.dart';
import 'package:recipes_app/feature/splash/view/splash_view.dart';

part 'navigation_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    AutoRoute(page: SplashView, initial: true),
    AutoRoute(
      page: HomeView,
      children: [
        AutoRoute(page: RecipesView),
        AutoRoute(page: FavoritesView),
      ],
    ),
    AutoRoute(page: RecipesDetailView),
    AutoRoute(page: RecipesSourceView),
  ],
)
class NavigationRouter extends _$NavigationRouter {}
