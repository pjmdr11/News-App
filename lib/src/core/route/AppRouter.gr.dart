// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:kliq_technical_test/src/presentation/screen/accounts/views/account_page.dart'
    as _i1;
import 'package:kliq_technical_test/src/presentation/screen/favourites/view/favourite_page.dart'
    as _i2;
import 'package:kliq_technical_test/src/presentation/screen/home/view/home_page.dart'
    as _i3;
import 'package:kliq_technical_test/src/presentation/screen/login/view/login_page.dart'
    as _i4;
import 'package:kliq_technical_test/src/presentation/screen/news/view/news_page.dart'
    as _i5;
import 'package:kliq_technical_test/src/presentation/screen/registration/view/registration_view.dart'
    as _i6;
import 'package:kliq_technical_test/src/presentation/screen/splashscreen/view/splash_screen.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountPage(),
      );
    },
    FavouriteRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FavouritePage(),
      );
    },
    HomeRouteView.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePageView(),
      );
    },
    Login.name: (routeData) {
      final args = routeData.argsAs<LoginArgs>(orElse: () => const LoginArgs());
      return _i8.AutoRoutePage<bool>(
        routeData: routeData,
        child: _i4.LoginPage(key: args.key),
      );
    },
    NewsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NewsPage(),
      );
    },
    Registration.name: (routeData) {
      final args = routeData.argsAs<RegistrationArgs>(
          orElse: () => const RegistrationArgs());
      return _i8.AutoRoutePage<bool>(
        routeData: routeData,
        child: _i6.Registration(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountPage]
class AccountRoute extends _i8.PageRouteInfo<void> {
  const AccountRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FavouritePage]
class FavouriteRoute extends _i8.PageRouteInfo<void> {
  const FavouriteRoute({List<_i8.PageRouteInfo>? children})
      : super(
          FavouriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePageView]
class HomeRouteView extends _i8.PageRouteInfo<void> {
  const HomeRouteView({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRouteView.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouteView';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class Login extends _i8.PageRouteInfo<LoginArgs> {
  Login({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          Login.name,
          args: LoginArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i8.PageInfo<LoginArgs> page = _i8.PageInfo<LoginArgs>(name);
}

class LoginArgs {
  const LoginArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'LoginArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.NewsPage]
class NewsRoute extends _i8.PageRouteInfo<void> {
  const NewsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.Registration]
class Registration extends _i8.PageRouteInfo<RegistrationArgs> {
  Registration({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          Registration.name,
          args: RegistrationArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Registration';

  static const _i8.PageInfo<RegistrationArgs> page =
      _i8.PageInfo<RegistrationArgs>(name);
}

class RegistrationArgs {
  const RegistrationArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'RegistrationArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
