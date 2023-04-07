// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:recipes_app/core/init/logger/i_logger_manager.dart' as _i4;
import 'package:recipes_app/core/init/navigation/i_navigation_service.dart'
    as _i6;
import 'package:recipes_app/core/init/network/i_network_manager.dart' as _i19;
import 'package:recipes_app/core/init/secure/i_secure_manager.dart' as _i8;
import 'package:recipes_app/core/init/storage/i_storage_manager.dart' as _i10;
import 'package:recipes_app/core/init/theme/i_theme_manager.dart' as _i12;
import 'package:recipes_app/feature/favorites/service/favorites_service.dart'
    as _i28;
import 'package:recipes_app/feature/favorites/service/i_favorites_service.dart'
    as _i27;
import 'package:recipes_app/feature/favorites/view_model/favorites_view_model.dart'
    as _i29;
import 'package:recipes_app/feature/home/view_model/home_view_model.dart'
    as _i3;
import 'package:recipes_app/feature/recipes/recipes_detail/service/i_recipes_detail_service.dart'
    as _i21;
import 'package:recipes_app/feature/recipes/recipes_detail/service/recipes_detail_service.dart'
    as _i22;
import 'package:recipes_app/feature/recipes/recipes_detail/view_model/recipes_detail_view_model.dart'
    as _i25;
import 'package:recipes_app/feature/recipes/recipes_source/view_model/recipes_source_view_model.dart'
    as _i17;
import 'package:recipes_app/feature/recipes/recipes_sub/service/i_recipes_service.dart'
    as _i23;
import 'package:recipes_app/feature/recipes/recipes_sub/service/recipes_service.dart'
    as _i24;
import 'package:recipes_app/feature/recipes/recipes_sub/view_model/recipes_view_model.dart'
    as _i26;
import 'package:recipes_app/feature/splash/view_model/splash_view_model.dart'
    as _i18;
import 'package:recipes_app/product/init/interceptor/app_interceptor.dart'
    as _i15;
import 'package:recipes_app/product/init/locale/locale_manager.dart' as _i16;
import 'package:recipes_app/product/init/logger/logger_manager.dart' as _i5;
import 'package:recipes_app/product/init/navigation/auto_router_manager.dart'
    as _i7;
import 'package:recipes_app/product/init/network/dio_manager.dart' as _i20;
import 'package:recipes_app/product/init/secure/secure_storage_manager.dart'
    as _i9;
import 'package:recipes_app/product/init/storage/hive_manager.dart' as _i11;
import 'package:recipes_app/product/init/theme/theme_manager.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.HomeViewModel>(() => _i3.HomeViewModel());
    gh.singleton<_i4.ILoggerManager>(_i5.LoggerManager());
    gh.singleton<_i6.INavigationService>(_i7.AutoRouterManager());
    gh.singleton<_i8.ISecureManager>(
        _i9.SecureStorageManager(gh<_i4.ILoggerManager>()));
    gh.singleton<_i10.IStorageManager>(
        _i11.HiveManager(gh<_i8.ISecureManager>()));
    gh.singleton<_i12.IThemeManager>(_i13.ThemeManager());
    gh.singleton<_i14.Interceptor>(_i15.AppInterceptor(
      gh<_i4.ILoggerManager>(),
      gh<_i10.IStorageManager>(),
      gh<_i6.INavigationService>(),
    ));
    gh.singleton<_i16.LocaleManager>(_i16.LocaleManager());
    gh.factory<_i17.RecipesSourceViewModel>(
        () => _i17.RecipesSourceViewModel());
    gh.factory<_i18.SplashViewModel>(() => _i18.SplashViewModel());
    gh.singleton<_i19.INetworkManager>(_i20.DioManager(gh<_i14.Interceptor>()));
    gh.factory<_i21.IRecipesDetailService>(() => _i22.RecipesDetailService(
          gh<_i19.INetworkManager>(),
          gh<_i10.IStorageManager>(),
        ));
    gh.factory<_i23.IRecipesService>(() => _i24.RecipesService(
          gh<_i19.INetworkManager>(),
          gh<_i10.IStorageManager>(),
        ));
    gh.factory<_i25.RecipesDetailViewModel>(
        () => _i25.RecipesDetailViewModel(gh<_i21.IRecipesDetailService>()));
    gh.factory<_i26.RecipesViewModel>(
        () => _i26.RecipesViewModel(gh<_i23.IRecipesService>()));
    gh.factory<_i27.IFavoritesService>(() => _i28.FavoritesService(
          gh<_i19.INetworkManager>(),
          gh<_i10.IStorageManager>(),
        ));
    gh.factory<_i29.FavoritesViewModel>(() => _i29.FavoritesViewModel(
          gh<_i27.IFavoritesService>(),
          gh<_i21.IRecipesDetailService>(),
        ));
    return this;
  }
}
