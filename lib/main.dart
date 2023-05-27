import 'package:flutter/material.dart';
import 'package:grocare_submission/provider/video_provider.dart';
import 'package:grocare_submission/screens/home_page.dart';
import 'package:grocare_submission/screens/videos_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => VideoProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        // home: HomePage(videos: [],),
        home: VideoPage(),
      ),
    );
  }
}