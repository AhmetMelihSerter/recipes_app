import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:recipes_app/core/base/view/base_view.dart';
import 'package:recipes_app/feature/splash/view_model/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          body: _buildBody(context),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: FlutterLogo(
        size: context.dynamicWidth(.5),
      ),
    );
  }
}
