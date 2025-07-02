import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kliq_technical_test/src/core/constants/app_constants.dart';
import 'package:kliq_technical_test/src/core/di/injection.dart';
import 'package:kliq_technical_test/src/core/route/AppRouter.gr.dart';
import 'package:kliq_technical_test/src/presentation/screen/app/cubit/app_cubit.dart';
import 'package:kliq_technical_test/src/presentation/screen/favourites/cubit/favourites_cubit.dart';
import 'package:kliq_technical_test/src/presentation/screen/home/cubit/home_cubit.dart';
import 'package:kliq_technical_test/src/presentation/screen/news/news.dart';

@RoutePage()
class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    const newsRoute = NewsRoute();
    const favouriteRoute = FavouriteRoute();
    const accountRoute = AccountRoute();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) {
          HomeCubit cubit = getIt<HomeCubit>();
          cubit.init();
          return cubit;
        }),
        BlocProvider(create: (ctx) {
          NewsCubit newsCubit = getIt();
          newsCubit.fetchLatestNews();
          return newsCubit;
        }),
        BlocProvider(create: (ctx) {
          FavouritesCubit cubit = getIt();
          cubit.fetchAllBookMarked();
          return cubit;
        }),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        listenWhen: (state, state1) {
          return state.sessionState != state1.sessionState;
        },
        builder: (context, state) {
          var tabs = const [newsRoute, favouriteRoute];
          var bottomNavItems = const [
            BottomNavigationBarItem(label: 'News', icon: Icon(Icons.newspaper)),
            BottomNavigationBarItem(
                label: 'Favourites', icon: Icon(Icons.bookmark)),
          ];
          if (state.sessionState ?? false) {
            tabs = const [newsRoute, favouriteRoute, accountRoute];
            bottomNavItems = const [
              BottomNavigationBarItem(
                  label: 'Home', icon: Icon(Icons.newspaper)),
              BottomNavigationBarItem(
                  label: 'Favourites', icon: Icon(Icons.bookmark)),
              BottomNavigationBarItem(
                  label: 'Accounts', icon: Icon(Icons.person_2))
            ];
          }
          return AutoTabsScaffold(
            routes: tabs,
            extendBodyBehindAppBar: true,
            bottomNavigationBuilder: (_, tabsRouter) {
              return BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  onTap: (index) {
                    if (index == 0) {}
                    switch (index) {
                      case 1:
                        getIt<FavouritesCubit>().fetchAllBookMarked();
                        break;
                    }
                    tabsRouter.setActiveIndex(index);
                  },
                  items: bottomNavItems);
            },
            appBarBuilder: (context, tabsRouter) {
              final isBrightTheme =
                  Theme.of(context).brightness == Brightness.light;
              return AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        getIt<AppCubit>().changeTheme(
                            isBrightTheme ? ThemeMode.dark : ThemeMode.light);
                      },
                      icon: Icon(
                          isBrightTheme ? Icons.dark_mode : Icons.light_mode))
                ],
                title: Text(
                  appBarTitles[tabsRouter.activeIndex],
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
