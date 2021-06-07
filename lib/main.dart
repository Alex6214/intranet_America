import 'package:flutter/material.dart';
import 'package:intranet_americagit/pages/splash/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intranet America con Git',
      home: SplashAmerica(),
    );
  }
}
