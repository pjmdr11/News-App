import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kliq_technical_test/src/core/constants/constants.dart';
import 'package:kliq_technical_test/src/core/di/injection.dart';
import 'package:kliq_technical_test/src/core/route/AppRouter.gr.dart';
import 'package:kliq_technical_test/src/data/models/models.dart';
import 'package:kliq_technical_test/src/presentation/screen/favourites/cubit/favourites_cubit.dart';
import 'package:kliq_technical_test/src/presentation/screen/home/cubit/home_cubit.dart';
import 'package:kliq_technical_test/src/presentation/screen/news/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsFeedItemWidget extends StatelessWidget {
  final NewsItemModel newsItem;
  final NewsCubit _newsCubit = getIt();
  final Function(NewsItemModel item)? itemClickListener;
  NewsFeedItemWidget(
      {required this.newsItem, this.itemClickListener, super.key});
  var router;
  @override
  Widget build(BuildContext context) {
    router = AutoRouter.of(context).root;

    final String thumbnail = newsItem.imageUrl ?? "";
    final String newsTitle = newsItem.title ?? "";
    final String newDescription = newsItem.description ?? "";
    final String newsId = newsItem.articleId ?? "";
    final newsLink = newsItem.link ?? "";
    final isBookmarked = _newsCubit.isNewsBookMarked(newsId);
    final defaultThumbnailWidget = Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10)),
      child: Icon(
        Icons.newspaper_outlined,
        size: 120,
        color: Colors.grey[500],
      ),
    );
    Widget thumbnailWidget = defaultThumbnailWidget;
    if (thumbnail.isNotEmpty) {
      thumbnailWidget = ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: thumbnail,
          height: 250,
          fit: BoxFit.cover,
          width: double.infinity,
          placeholder: (context, url) => defaultThumbnailWidget,
          errorWidget: (context, url, error) {
            return defaultThumbnailWidget;
          },
        ),
      );
    }
    return Material(
      child: InkWell(
        onTap: () {
          try {
            if (newsLink.isNotEmpty) {
              launchUrl(Uri.parse(newsLink));
            }
          } catch (e) {
            Fluttertoast.showToast(msg: taskCompletionFailed);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              thumbnailWidget,
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      newsTitle,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        final newsCubit = getIt<NewsCubit>();
                        final homeCubit = getIt<HomeCubit>();
                        final favCubit = getIt<FavouritesCubit>();
                        if (homeCubit.state.sessionState ?? false) {
                          Fluttertoast.showToast(
                              msg: newsCubit.isNewsBookMarked(
                                      newsItem.articleId ?? "")
                                  ? bookmarkRemoved
                                  : bookmarkSuccess);
                          newsCubit.bookMarkNews(newsItem);
                          favCubit.fetchAllBookMarked(delay: false);
                        } else {
                          navigateToLogin(context);
                        }
                      },
                      icon: Icon(isBookmarked
                          ? Icons.bookmark
                          : Icons.bookmark_outline)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              newDescription.isEmpty
                  ? const SizedBox()
                  : Text(
                      newDescription,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 6,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToLogin(BuildContext context) async {
    Fluttertoast.showToast(msg: loginRequiredMessage);
    bool? results = await context.router.push<bool>(Login());
    if (results ?? false) {
      getIt<HomeCubit>().init();
    }
  }
}
