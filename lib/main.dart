import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/screens/home_screen.dart';
import 'package:news_app/features/screens/news_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(primarySwatch: Colors.blue),
     
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.news:(context) => const NewsScreen(),
      },
    );
  }
}
