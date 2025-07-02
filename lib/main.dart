import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:kliq_technical_test/src/core/di/injection.dart';
import 'package:kliq_technical_test/src/data/source/local/hive/news/news.dart';
import 'package:kliq_technical_test/src/data/source/source.dart';
import 'package:kliq_technical_test/src/presentation/screen/app/app.dart';
import 'package:kliq_technical_test/src/presentation/screen/bloc_listener.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(NewsAdapter());
  await dotenv.load(fileName: ".env");
  configureInjection(kDebugMode ? Environment.dev : Environment.prod);
  Bloc.observer = SimpleBlocObserver();
  getIt.allReady().then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppCubit>(),
        ),
      ],
      child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: false,
          designSize: const Size(360, 690),
          child: AppView()),
    );
  }
}
