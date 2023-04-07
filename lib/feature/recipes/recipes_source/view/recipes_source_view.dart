import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:recipes_app/core/base/view/base_view.dart';
import 'package:recipes_app/feature/recipes/recipes_source/model/recipes_source_args.dart';
import 'package:recipes_app/feature/recipes/recipes_source/view_model/recipes_source_view_model.dart';
import 'package:recipes_app/product/components/app_bar/custom_app_bar.dart';
import 'package:recipes_app/product/constants/locale/locale_keys.g.dart';

class RecipesSourceView extends StatelessWidget {
  const RecipesSourceView({
    super.key,
    required RecipesSourceArgs args,
  }) : _args = args;

  final RecipesSourceArgs _args;

  @override
  Widget build(BuildContext context) {
    return BaseView<RecipesSourceViewModel>(
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

  CustomAppBar _buildAppBar(RecipesSourceViewModel viewModel) {
    return CustomAppBar(
      title: Text(
        LocaleKeys.home_recipes_source_view_app_bar_title.tr(),
      ),
    );
  }

  Widget _buildBody(RecipesSourceViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InAppWebView(
        initialUrlRequest: viewModel.initialUrlRequest,
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
            mediaPlaybackRequiresUserGesture: false,
          ),
          android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
          ),
          ios: IOSInAppWebViewOptions(
            allowsInlineMediaPlayback: true,
          ),
        ),
        pullToRefreshController: viewModel.pullToRefreshController,
        onWebViewCreated: (controller) {
          viewModel.webViewController = controller;
        },
        onLoadStart: viewModel.onLoadStart,
        onLoadStop: viewModel.onPageFinished,
      ),
    );
  }
}
