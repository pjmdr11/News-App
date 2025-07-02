import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kliq_technical_test/src/core/constants/constants.dart';
import 'package:kliq_technical_test/src/core/di/injection.dart';
import 'package:kliq_technical_test/src/data/models/models.dart';
import 'package:kliq_technical_test/src/presentation/custom_widgets/custom_widgets.dart';
import 'package:kliq_technical_test/src/presentation/custom_widgets/empty_widget.dart';
import 'package:kliq_technical_test/src/presentation/screen/favourites/cubit/favourites_cubit.dart';
import 'package:kliq_technical_test/src/presentation/screen/home/cubit/home_cubit.dart';

@RoutePage()
class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: bodyWidget());
  }

  bodyWidget() {
    HomeCubit homeCubit = getIt();
    Widget emptyFeeds = const Center(
      child: EmptyWidget(
        icon: Icons.feed_sharp,
        title: feedsEmpty,
      ),
    );
    if (!(homeCubit.state.sessionState ?? false)) {
      return emptyFeeds;
    }
    return BlocConsumer<FavouritesCubit, FavouritesState>(
        builder: (ctx, state) {
          if (state.isLoading ?? true) {
            return Center(
              child: CustomLoader(),
            );
          } else {
            if (state.news?.isEmpty ?? true) {
              return emptyFeeds;
            }
            return ListView.separated(
                itemBuilder: (ctx, i) {
                  NewsItemModel newsItem = state.news![i];
                  return NewsFeedItemWidget(newsItem: newsItem);
                },
                separatorBuilder: (ct, i) {
                  return const SizedBox(
                    height: 14,
                  );
                },
                itemCount: state.news?.length ?? 0);
          }
        },
        listener: (ctx, state) {});
  }
}
