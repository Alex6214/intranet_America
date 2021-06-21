import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intranet_americagit/pages/birthday/abril/abril.dart';
import 'package:intranet_americagit/pages/birthday/agosto/agosto.dart';
import 'package:intranet_americagit/pages/birthday/diciembre/diciembre.dart';
import 'package:intranet_americagit/pages/birthday/enero/enero.dart';
import 'package:intranet_americagit/pages/birthday/febrero/febrero.dart';
import 'package:intranet_americagit/pages/birthday/julio/julio.dart';
import 'package:intranet_americagit/pages/birthday/junio/junio.dart';
import 'package:intranet_americagit/pages/birthday/marzo/marzo.dart';
import 'package:intranet_americagit/pages/birthday/mayo/mayo.dart';
import 'package:intranet_americagit/pages/birthday/noviembre/noviembre.dart';
import 'package:intranet_americagit/pages/birthday/octubre/octubre.dart';
import 'package:intranet_americagit/pages/birthday/setiembre/setiembre.dart';
import 'package:intranet_americagit/pages/principal/principal_page.dart';

class Mounths extends StatefulWidget {
  const Mounths({Key? key}) : super(key: key);

  @override
  _MounthsState createState() => _MounthsState();
}

class _MounthsState extends State<Mounths> {
  @override
  Widget build(BuildContext context) {
    final color = Color(0xff022d4f);
    final size = MediaQuery.of(context).size;
    final styletextname = GoogleFonts.poppins(
        fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);
    // final style = TextStyle(
    // color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Image.asset(
          'assets/image/Logo.JPG',
          height: 55,
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.reply_outlined),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrincipalPageAmerica(),
                ));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white24,
          ),
          child: Column(
            children: [
              Container(
                height: 300,
                width: size.width,
                child: Bounce(
                  duration: Duration(seconds: 2),
                  child: SvgPicture.asset(
                    'assets/icon/birthday.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Divider(),
              SlideInRight(
                duration: Duration(seconds: 2),
                child: Container(
                  width: size.width,
                  height: 335,
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Enero(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.cyanAccent, Colors.white12],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Enero',
                                style: styletextname,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Febrero(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.cyanAccent, Colors.white12],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Febrero',
                                style: styletextname,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Marzo(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.cyanAccent, Colors.white12],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Marzo',
                                style: styletextname,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Abril(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.cyanAccent, Colors.white12],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Abril',
                                style: styletextname,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Mayo(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.cyanAccent, Colors.white12],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Mayo',
                                style: styletextname,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Junio(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.cyanAccent, Colors.white12],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Junio',
                                style: styletextname,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Julio(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.cyanAccent, Colors.white12],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Julio',
                                style: styletextname,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Agosto(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.cyanAccent, Colors.white12],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Agosto',
                                style: styletextname,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Setiembre(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.cyanAccent, Colors.white12],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Setiembre',
                                style: styletextname,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Octubre(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.cyanAccent, Colors.white12],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Octubre',
                                style: styletextname,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Noviembre(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.cyanAccent, Colors.white12],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Noviembre',
                                style: styletextname,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Diciembre(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [Colors.cyanAccent, Colors.white12],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Diciembre',
                                style: styletextname,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
