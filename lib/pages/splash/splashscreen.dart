import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intranet_americagit/pages/login/loginscrenn.dart';
import 'package:intranet_americagit/pages/principal/principal_page.dart';
//import 'package:intranet_americagit/pages/principal/principal_page.dart';

class SplashAmerica extends StatefulWidget {
  const SplashAmerica({Key? key}) : super(key: key);

  @override
  _SplashAmericaState createState() => _SplashAmericaState();
}

class _SplashAmericaState extends State<SplashAmerica> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            //return Login();

            return PrincipalPageAmerica();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = Color(0xff022d4f);
    return Container(
      decoration: BoxDecoration(color: color),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ZoomIn(
            duration: Duration(seconds: 1),
            child: Image.asset('assets/image/Logo.JPG')),
      ),
    );
  }
}
