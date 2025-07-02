import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kliq_technical_test/src/presentation/screen/news/view/news_page_body.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NewsPageBody();
  }
}
