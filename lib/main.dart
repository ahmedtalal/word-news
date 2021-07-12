import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:worldnews/backend/repositories/api_db/news_repository_imp.dart';
import 'package:worldnews/backend/repositories/firebase/firebase_repo_imp.dart';
import 'package:worldnews/providers/bloc_pattern/api_bloc/news_bloc.dart';
import 'package:worldnews/pages/SplashScreen.dart';
import 'package:worldnews/providers/bloc_pattern/firebase_bloc/firebase_bloc.dart';
import 'package:worldnews/providers/provider/Country_provider.dart';

main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // is used to interact with firebase engine >>
  await Firebase.initializeApp();
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountryProvider>(
          create: (context) => CountryProvider(),
        ),
        BlocProvider<NewsBloc>(
          create: (context) {
            return NewsBloc(
              repositoryModel: NewsRepoImplement(),
            );
          },
        ),
        BlocProvider<FirebaseBloc>(
          create: (context) {
            return FirebaseBloc(
              repositoryModel: FirebaseRepoImplement(),
            );
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
