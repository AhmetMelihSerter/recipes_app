import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/core/base/view/base_view.dart';
import 'package:recipes_app/feature/_model/digest_model.dart';
import 'package:recipes_app/feature/_model/recipe_model.dart';
import 'package:recipes_app/feature/favorites/view_model/favorites_view_model.dart';
import 'package:recipes_app/product/components/app_bar/custom_app_bar.dart';
import 'package:recipes_app/product/constants/extensions/ui_extensions.dart';
import 'package:recipes_app/product/constants/locale/locale_keys.g.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<FavoritesViewModel>(
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(viewModel),
        );
      },
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: Text(
        LocaleKeys.home_favorites_view_app_bar_title.tr(),
      ),
    );
  }

  Widget _buildBody(FavoritesViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _buildFavoritesList(),
        ],
      ),
    );
  }

  Widget _buildFavoritesList() {
    return Expanded(
      child: Consumer<FavoritesViewModel>(
        builder: (context, viewModel, child) => ListView.separated(
          itemCount: viewModel.favoritesList.length,
          separatorBuilder: (context, index) => _buildSeparator(),
          itemBuilder: (_, index) {
            return _buildListItem(index, viewModel);
          },
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return const Divider(
      color: Colors.grey,
    );
  }

  Widget _buildListItem(int index, FavoritesViewModel viewModel) {
    final model = viewModel.favoritesList[index];
    return InkWell(
      onTap: () => viewModel.onRecipeDetail(index),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              spacing: 10,
              label: LocaleKeys.home_favorites_view_remove_favorites.tr(),
              backgroundColor: Colors.red,
              icon: Icons.delete,
              onPressed: (context) {
                viewModel.deleteFavorites(index);
              },
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildListItemLabels(model),
            buildSpacer(height: .01),
            _buildListItemDigests(model),
          ],
        ),
      ),
    );
  }

  Widget _buildListItemLabels(RecipeModel? model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: Image.network(
            model?.image ?? '',
          ),
        ),
        Flexible(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model?.label ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  model?.joinedLabels ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListItemDigests(RecipeModel? model) {
    return Container(
      color: Colors.grey,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: _buildDigestLeft(model),
          ),
          Flexible(
            child: _buildDigestCenter(model),
          ),
          Flexible(
            child: _buildDigestRight(model),
          ),
        ],
      ),
    );
  }

  Widget _buildDigestLeft(RecipeModel? model) {
    return Column(
      children: [
        Text(
          LocaleKeys.home_favorites_view_servings.tr(
            args: ['${model?.yields?.toInt() ?? ''}'],
          ),
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        Text(
          LocaleKeys.home_favorites_view_calories.tr(
            args: ['${model?.kCal ?? 0}'],
          ),
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildDigestCenter(RecipeModel? model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDigestModelItem(
          model?.protein,
        ),
        _buildDigestModelItem(
          model?.carboHydrate,
        ),
        _buildDigestModelItem(
          model?.fat,
        ),
      ],
    );
  }

  Widget _buildDigestRight(RecipeModel? model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDigestModelItem(
          model?.cholesterol,
        ),
        _buildDigestModelItem(
          model?.sodium,
        ),
        _buildDigestModelItem(
          model?.calcium,
        ),
        _buildDigestModelItem(
          model?.magnesium,
        ),
        _buildDigestModelItem(
          model?.potassium,
        ),
        _buildDigestModelItem(
          model?.iron,
        ),
      ],
    );
  }

  Widget _buildDigestModelItem(DigestModel? model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model?.label ?? '',
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${model?.totalValue ?? ''} ',
            ),
            Text(
              model?.unit ?? '',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
