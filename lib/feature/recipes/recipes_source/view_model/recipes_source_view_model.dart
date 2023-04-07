import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:kartal/kartal.dart';

import 'package:recipes_app/core/base/view_model/base_view_model.dart';
import 'package:recipes_app/feature/recipes/recipes_source/model/recipes_source_args.dart';

class RecipesSourceViewModel extends BaseViewModel {
  late final URLRequest initialUrlRequest;

  InAppWebViewController? webViewController;

  late final PullToRefreshController pullToRefreshController;

  late final RecipesSourceArgs _args;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  void setArgs(RecipesSourceArgs args) => _args = args;

  @override
  void init() {
    initialUrlRequest = URLRequest(
      url: Uri.parse(_args.url),
    );
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (viewModelContext.isAndroidDevice) {
          await webViewController?.reload();
        } else if (viewModelContext.isIOSDevice) {
          await webViewController?.loadUrl(
            urlRequest: URLRequest(
              url: await webViewController?.getUrl(),
            ),
          );
        }
      },
    );
  }

  void onLoadStart(InAppWebViewController controller, Uri? url) {
    logger.debug('Page started loading: $url');
  }

  void onPageFinished(InAppWebViewController controller, Uri? url) {
    logger.debug('Page finished loading: $url');
    pullToRefreshController.endRefreshing();
  }
}
