import 'package:flutter/material.dart';
import 'package:flutter_isolate/constants/app_constants.dart';
import 'package:flutter_isolate/features/home/home_screen.dart';
import 'package:flutter_isolate/themes/colors.dart';
import 'package:flutter_isolate/utils/keys.dart';

class TutorialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: primary,
      title: APP_NAME,
      home: HomeScreen(),
      navigatorKey: navigatorKey,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}
