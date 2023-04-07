import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/core/base/view/base_view.dart';
import 'package:recipes_app/feature/favorites/view/favorites_view.dart';
import 'package:recipes_app/feature/home/view_model/home_view_model.dart';
import 'package:recipes_app/feature/recipes/recipes_sub/view/recipes_view.dart';
import 'package:recipes_app/product/constants/locale/locale_keys.g.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          bottomNavigationBar: _buildBottomNavigationBar(),
          body: _buildBody(viewModel),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) => BottomNavigationBar(
        currentIndex: viewModel.pageIndex,
        onTap: viewModel.setPageIndex,
        items: [
          _buildBottomNavigationBarItem(
            LocaleKeys.home_home_view_bottom_navigation_item_recipes,
            Icons.home,
          ),
          _buildBottomNavigationBarItem(
            LocaleKeys.home_home_view_bottom_navigation_item_favorites,
            Icons.favorite,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String text,
    IconData icon,
  ) {
    return BottomNavigationBarItem(
      label: text.tr(),
      icon: Icon(icon),
    );
  }

  Widget _buildBody(HomeViewModel viewModel) {
    return PageView.builder(
      itemCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      controller: viewModel.pageController,
      onPageChanged: viewModel.setPageIndex,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const RecipesView();
        }
        return const FavoritesView();
      },
    );
  }
}
