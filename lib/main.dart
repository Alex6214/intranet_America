import 'package:flutter/material.dart';
import 'package:intranet_americagit/pages/splash/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Intranet America con Git',
      home: SplashAmerica(),
    );
  }
}
