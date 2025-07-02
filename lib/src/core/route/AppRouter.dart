import 'package:auto_route/auto_route.dart';
import 'package:kliq_technical_test/src/core/route/AppRouter.gr.dart';
import 'package:kliq_technical_test/src/core/route/route_constants.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: routeSplashScreen, page: SplashRoute.page),
        AutoRoute(
            page: HomeRouteView.page,
            path: routeHomepage,
            initial: true,
            children: [
              AutoRoute(page: NewsRoute.page, path: routeNewsHome),
              AutoRoute(page: AccountRoute.page, path: routeAccounts),
              AutoRoute(page: FavouriteRoute.page, path: routeFavourites),
            ]),
        AutoRoute(
          page: Login.page,
          path: routeLogin,
        ),
        AutoRoute(page: Registration.page, path: routeRegister),
      ];
}
