// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kliq_technical_test/src/core/modules/dio_module.dart' as _i37;
import 'package:kliq_technical_test/src/core/modules/hive_module.dart' as _i36;
import 'package:kliq_technical_test/src/core/resources/data_state.dart' as _i18;
import 'package:kliq_technical_test/src/core/services/api/news_api_services.dart'
    as _i3;
import 'package:kliq_technical_test/src/core/utils/debouncer.dart' as _i11;
import 'package:kliq_technical_test/src/data/repository/app_repository_impl.dart'
    as _i13;
import 'package:kliq_technical_test/src/data/repository/news_repository_impl.dart'
    as _i22;
import 'package:kliq_technical_test/src/data/repository/user_repository_impl.dart'
    as _i24;
import 'package:kliq_technical_test/src/data/source/local/env_helper.dart'
    as _i4;
import 'package:kliq_technical_test/src/data/source/local/hive/default/hive_helper.dart'
    as _i7;
import 'package:kliq_technical_test/src/data/source/local/hive/default/hive_helper_impl.dart'
    as _i8;
import 'package:kliq_technical_test/src/data/source/local/hive/news/hive_news_helper.dart'
    as _i14;
import 'package:kliq_technical_test/src/data/source/local/hive/news/hive_news_helper.impl.dart'
    as _i15;
import 'package:kliq_technical_test/src/data/source/local/hive/news/news.dart'
    as _i6;
import 'package:kliq_technical_test/src/data/source/local/hive/users/hive_user_helper.dart'
    as _i19;
import 'package:kliq_technical_test/src/data/source/local/hive/users/hive_user_helper_impl.dart'
    as _i20;
import 'package:kliq_technical_test/src/data/source/local/hive/users/user.dart'
    as _i16;
import 'package:kliq_technical_test/src/data/source/source.dart' as _i9;
import 'package:kliq_technical_test/src/domain/repositories/app_repository.dart'
    as _i12;
import 'package:kliq_technical_test/src/domain/repositories/news_repository.dart'
    as _i21;
import 'package:kliq_technical_test/src/domain/repositories/repositories.dart'
    as _i23;
import 'package:kliq_technical_test/src/domain/usecases/app_use_case.dart'
    as _i25;
import 'package:kliq_technical_test/src/domain/usecases/news_use_case.dart'
    as _i26;
import 'package:kliq_technical_test/src/domain/usecases/use_cases.dart' as _i29;
import 'package:kliq_technical_test/src/domain/usecases/user_use_case.dart'
    as _i31;
import 'package:kliq_technical_test/src/presentation/screen/accounts/cubit/account_cubit.dart'
    as _i32;
import 'package:kliq_technical_test/src/presentation/screen/app/cubit/app_cubit.dart'
    as _i30;
import 'package:kliq_technical_test/src/presentation/screen/favourites/cubit/favourites_cubit.dart'
    as _i28;
import 'package:kliq_technical_test/src/presentation/screen/home/cubit/home_cubit.dart'
    as _i33;
import 'package:kliq_technical_test/src/presentation/screen/login/cubit/login_cubit.dart'
    as _i34;
import 'package:kliq_technical_test/src/presentation/screen/news/cubit/news_cubit.dart'
    as _i27;
import 'package:kliq_technical_test/src/presentation/screen/registration/cubit/registration_cubit.dart'
    as _i17;
import 'package:kliq_technical_test/src/presentation/screen/splashscreen/cubit/splashcreen_cubit.dart'
    as _i35;

const String _prod = 'prod';
const String _dev = 'dev';

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
    final hiveModule = _$HiveModule();
    final dioModule = _$DioModule();
    gh.lazySingleton<_i3.NewsApiService>(() => _i3.NewsApiService.create());
    gh.lazySingleton<_i4.EnvHelper>(() => _i4.EnvHelper());
    gh.singletonAsync<_i5.Box<dynamic>>(
      () => hiveModule.hive(),
      instanceName: 'hive_def',
    );
    gh.singletonAsync<_i5.Box<_i6.NewsDb>>(
      () => hiveModule.hiveNews(),
      instanceName: 'hive_news',
    );
    gh.lazySingletonAsync<_i7.HiveHelper>(() async => _i8.HiveHelperImpl(
        hive: await getAsync<_i5.Box<dynamic>>(instanceName: 'hive_def')));
    gh.singletonAsync<_i5.Box<_i9.UserDb>>(
      () => hiveModule.hiveUser(),
      instanceName: 'hive_users',
    );
    gh.lazySingleton<_i10.Dio>(
      () => dioModule.dio(gh<_i9.EnvHelper>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i11.Debouncer>(() => _i11.Debouncer(milliseconds: gh<int>()));
    gh.singletonAsync<_i12.AppRepository>(() async =>
        _i13.AppRepositoryImpl(hiveHelper: await getAsync<_i7.HiveHelper>()));
    gh.lazySingletonAsync<_i14.HiveNewsHelper>(() async =>
        _i15.HiveNewsHelperImpl(
            newsBox: await getAsync<_i5.Box<_i6.NewsDb>>(
                instanceName: 'hive_news')));
    gh.lazySingleton<_i16.UserDb>(() => _i16.UserDb(
          email: gh<String>(),
          password: gh<String>(),
          id: gh<String>(),
          name: gh<String>(),
        ));
    gh.factory<_i17.RegistrationState>(() => _i17.RegistrationState(
          email: gh<String>(),
          password: gh<String>(),
          fullName: gh<String>(),
          isLoading: gh<bool>(),
          appState: gh<_i18.DataState<dynamic>>(),
        ));
    gh.lazySingleton<_i19.HiveUserHelper>(() => _i20.HiveUserHelperImpl(
        userBox: gh<_i5.Box<_i16.UserDb>>(instanceName: 'hive_users')));
    gh.lazySingleton<_i21.NewsRepository>(() => _i22.NewsRepositoryImpl(
          newsApiService: gh<_i3.NewsApiService>(),
          envHelper: gh<_i4.EnvHelper>(),
        ));
    gh.lazySingleton<_i23.UserRepository>(() => _i24.UserRepositoryImpl(
          hiveUserDb: gh<_i9.HiveUserHelper>(),
          hiveDb: gh<_i9.HiveHelper>(),
        ));
    gh.lazySingleton<_i25.AppUseCase>(
        () => _i25.AppUseCase(appRepository: gh<_i23.AppRepository>()));
    gh.lazySingletonAsync<_i26.NewsUseCase>(() async => _i26.NewsUseCase(
          newsRepository: gh<_i23.NewsRepository>(),
          newsDbHelper: await getAsync<_i14.HiveNewsHelper>(),
        ));
    gh.singletonAsync<_i27.NewsCubit>(() async =>
        _i27.NewsCubit(newsUseCase: await getAsync<_i26.NewsUseCase>()));
    gh.lazySingleton<_i28.FavouritesCubit>(
        () => _i28.FavouritesCubit(newsUseCase: gh<_i29.NewsUseCase>()));
    gh.lazySingleton<_i30.AppCubit>(
        () => _i30.AppCubit(appUseCase: gh<_i29.AppUseCase>()));
    gh.lazySingleton<_i31.UserUseCase>(
        () => _i31.UserUseCase(userRepo: gh<_i23.UserRepository>()));
    gh.lazySingleton<_i32.AccountCubit>(() => _i32.AccountCubit(
          userUseCase: gh<_i29.UserUseCase>(),
          newUseCase: gh<_i29.NewsUseCase>(),
        ));
    gh.lazySingleton<_i33.HomeCubit>(
        () => _i33.HomeCubit(userUseCase: gh<_i29.UserUseCase>()));
    gh.factory<_i34.LoginCubit>(
        () => _i34.LoginCubit(userUseCase: gh<_i31.UserUseCase>()));
    gh.factory<_i35.SplashcreenCubit>(
        () => _i35.SplashcreenCubit(userUseCase: gh<_i31.UserUseCase>()));
    gh.factory<_i17.RegistrationCubit>(
        () => _i17.RegistrationCubit(userUseCase: gh<_i31.UserUseCase>()));
    return this;
  }
}

class _$HiveModule extends _i36.HiveModule {}

class _$DioModule extends _i37.DioModule {}
