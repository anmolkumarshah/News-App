import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Screens/news_overview.dart';
import './Providers/category_provider.dart';
import './Providers/News_provider.dart';
import './Screens/category_screen.dart';
import './Screens/news_site_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => NewsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: NewsOverview(),
        routes: {
          "/category-screen": (ctx) => CategogyScreen(),
          "/web-screen": (ctx) => NewsSiteScreen(),
        },
      ),
    );
  }
}
