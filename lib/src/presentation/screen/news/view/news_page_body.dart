import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kliq_technical_test/src/core/constants/constants.dart';
import 'package:kliq_technical_test/src/core/di/injection.dart';
import 'package:kliq_technical_test/src/core/resources/data_state.dart';
import 'package:kliq_technical_test/src/core/utils/debouncer.dart';
import 'package:kliq_technical_test/src/data/models/models.dart';
import 'package:kliq_technical_test/src/presentation/custom_widgets/custom_widgets.dart';
import 'package:kliq_technical_test/src/presentation/custom_widgets/empty_widget.dart';
import 'package:kliq_technical_test/src/presentation/screen/news/news.dart';

class NewsPageBody extends StatelessWidget {
  final Debouncer debouncer = Debouncer(milliseconds: 2000);
  NewsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<NewsCubit, NewsState>(
            builder: (ctx, state) {
              if (state.isLoading ?? false) {
                return Center(
                  child: CustomLoader(),
                );
              } else {
                if (state.state is ResultFailure) {
                  return const Center(
                    child: EmptyWidget(
                      icon: Icons.error,
                      title: taskCompletionFailed,
                    ),
                  );
                } else {
                  NewsResponseModel? newsResponse = state.state?.data;
                  if ((newsResponse?.results ?? 0) == 0) {
                    return const Center(
                      child: EmptyWidget(
                        title: errEmptyNews,
                        icon: Icons.newspaper,
                      ),
                    );
                  } else {
                    return RefreshIndicator(
                      onRefresh: () {
                        return getIt<NewsCubit>().fetchLatestNews();
                      },
                      child: Column(
                        children: [
                          Expanded(
                              child: NotificationListener(
                            onNotification: (ScrollNotification notification) {
                              if (notification.metrics.atEdge) {
                                if (notification.metrics.pixels > 0) {
                                  if (!((getIt<NewsCubit>().isPaginated ??
                                      false))) {
                                    getIt<NewsCubit>().isPaginated = true;
                                    if (!(state.isPaginating ?? false)) {
                                      getIt<NewsCubit>().fetchNextPage(
                                          state.state?.data?.nextPage ?? "");
                                    }
                                  }
                                }
                              }
                              return true;
                            },
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 14,
                              ),
                              itemBuilder: (ctx, index) {
                                return NewsFeedItemWidget(
                                  newsItem: newsResponse!.results![index],
                                  itemClickListener: (NewsItemModel model) {},
                                );
                              },
                              itemCount: newsResponse?.results?.length ?? 0,
                            ),
                          )),
                          (state.isPaginating ?? false)
                              ? Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: CustomLoader(),
                                )
                              : const SizedBox()
                        ],
                      ),
                    );
                  }
                }
              }
            },
            listener: (_, state) {}));
  }
}
