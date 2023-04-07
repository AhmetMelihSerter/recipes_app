import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/core/base/view/base_view.dart';
import 'package:recipes_app/core/constants/app/application_constants.dart';
import 'package:recipes_app/feature/_model/digest_model.dart';
import 'package:recipes_app/feature/_model/recipe_model.dart';
import 'package:recipes_app/feature/recipes/recipes_sub/view_model/recipes_view_model.dart';
import 'package:recipes_app/product/components/app_bar/custom_app_bar.dart';
import 'package:recipes_app/product/components/text_field/search_text_field.dart';
import 'package:recipes_app/product/constants/enums/product_enum.dart';
import 'package:recipes_app/product/constants/extensions/ui_extensions.dart';
import 'package:recipes_app/product/constants/locale/locale_keys.g.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<RecipesViewModel>(
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..init();
      },
      onDispose: (model) => model.onDispose(),
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _buildAppBar(),
          endDrawer: _endDrawer(),
          body: _buildBody(viewModel),
        );
      },
    );
  }

  CustomAppBar _buildAppBar() {
    return const CustomAppBar(
      title: Text(
        ApplicationConstants.APP_NAME,
      ),
    );
  }

  Widget _endDrawer() {
    return Drawer(
      child: Column(
        children: [
          buildSpacer(),
          Consumer<RecipesViewModel>(
            builder: (context, viewModel, child) => MultiSelectDialogField(
              initialValue: viewModel.selectedHealthTypeList,
              items: HealthType.values
                  .map((e) => MultiSelectItem(e, e.name))
                  .toList(),
              title: Text(
                LocaleKeys.home_recipes_view_multiple_select_item_title.tr(),
              ),
              buttonText: Text(
                LocaleKeys.home_recipes_view_multiple_select_item_button.tr(),
              ),
              confirmText: Text(
                LocaleKeys.home_recipes_view_multiple_select_item_confirm.tr(),
              ),
              cancelText: Text(
                LocaleKeys.home_recipes_view_multiple_select_item_cancel.tr(),
              ),
              onConfirm: (values) {
                viewModel.setHealthType(values);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(RecipesViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _buildSearch(viewModel),
          buildSpacer(height: .02),
          _buildRecipesList(),
        ],
      ),
    );
  }

  Widget _buildSearch(RecipesViewModel viewModel) {
    return SearchTextField(
      onChanged: viewModel.onChangedSearch,
      controller: viewModel.searchController,
      inputHistoryController: viewModel.searchHistoryController,
      onClear: viewModel.onSearchClear,
      hintText: LocaleKeys.home_recipes_view_text_field_search.tr(),
    );
  }

  Widget _buildRecipesList() {
    return Expanded(
      child: Consumer<RecipesViewModel>(
        builder: (context, viewModel, child) => FadeInUp(
          key: viewModel.fadeInUpKey,
          preferences: AnimationPreferences(
            autoPlay: viewModel.animationType,
            animationStatusListener: viewModel.animationStatusListener,
          ),
          child: ListView.separated(
            itemCount: viewModel.recipesResponseModel?.hits?.length ?? 0,
            separatorBuilder: (context, index) => _buildSeparator(),
            itemBuilder: (_, index) {
              return _buildListItem(context, index, viewModel);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return const Divider(
      color: Colors.grey,
    );
  }

  Widget _buildListItem(
    BuildContext context,
    int index,
    RecipesViewModel viewModel,
  ) {
    final model = viewModel.recipesResponseModel!.hits![index].recipe;
    return InkWell(
      onTap: () => viewModel.onRecipeDetail(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildListItemLabels(model),
          buildSpacer(height: .01),
          _buildListItemDigests(model),
        ],
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
          LocaleKeys.home_recipes_view_servings.tr(
            args: ['${model?.yields?.toInt() ?? ''}'],
          ),
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        Text(
          LocaleKeys.home_recipes_view_calories.tr(
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
