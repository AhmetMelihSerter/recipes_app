import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/core/base/view/base_view.dart';
import 'package:recipes_app/feature/_model/recipe_model.dart';
import 'package:recipes_app/feature/recipes/recipes_detail/view_model/recipes_detail_view_model.dart';
import 'package:recipes_app/product/components/app_bar/custom_app_bar.dart';
import 'package:recipes_app/product/components/button/custom_outlined_button.dart';
import 'package:recipes_app/product/constants/locale/locale_keys.g.dart';

class RecipesDetailView extends StatelessWidget {
  const RecipesDetailView({
    super.key,
    required RecipeModel args,
  }) : _args = args;

  final RecipeModel _args;

  @override
  Widget build(BuildContext context) {
    return BaseView<RecipesDetailViewModel>(
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..setArgs(_args)
          ..init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _buildAppBar(viewModel),
          body: _buildBody(viewModel),
        );
      },
    );
  }

  CustomAppBar _buildAppBar(RecipesDetailViewModel viewModel) {
    return CustomAppBar(
      title: Text(
        LocaleKeys.home_recipes_detail_view_app_bar_title.tr(),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.ios_share,
          ),
          onPressed: viewModel.shareNews,
        ),
        Consumer<RecipesDetailViewModel>(
          builder: (context, value, child) => IconButton(
            icon: Icon(
              viewModel.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: viewModel.onTapFavorites,
          ),
        ),
      ],
    );
  }

  Widget _buildBody(RecipesDetailViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: _buildImage(viewModel),
          ),
          Expanded(
            child: Center(
              child: Text(
                viewModel.recipeModel.label ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Consumer<RecipesDetailViewModel>(
            builder: (context, viewModel, child) => Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: _buildIngredientItem(viewModel),
              ),
            ),
          ),
          _buildShowSource(viewModel),
        ],
      ),
    );
  }

  Widget _buildImage(RecipesDetailViewModel viewModel) {
    return Image.network(
      viewModel.recipeModel.image ?? '',
    );
  }

  Widget _buildIngredientItem(RecipesDetailViewModel viewModel) {
    final ingredientLen = viewModel.recipeModel.ingredientLines?.length ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < ingredientLen; i++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${i + 1}) '),
              Flexible(
                child: Text(
                  '${viewModel.recipeModel.ingredientLines?[i] ?? ''}\n',
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildShowSource(RecipesDetailViewModel viewModel) {
    return CustomOutlinedButton(
      onPressed: viewModel.onSource,
      child: Text(
        LocaleKeys.home_recipes_detail_view_recipes_source_button.tr(),
      ),
    );
  }
}
