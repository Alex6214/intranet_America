import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrincipalPageAmerica extends StatefulWidget {
  const PrincipalPageAmerica({Key? key}) : super(key: key);

  @override
  _PrincipalPageAmericaState createState() => _PrincipalPageAmericaState();
}

class _PrincipalPageAmericaState extends State<PrincipalPageAmerica> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          //padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: SvgPicture.asset(
                "assets/icon/drawer.svg",
                height: size.height * 0.30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icon/mof.svg",
                height: 25,
              ),
              trailing: Icon(Icons.download_rounded),
              title: Text('MOF'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icon/ley.svg",
                height: 25,
              ),
              trailing: Icon(Icons.download_rounded),
              title: Text('RIT'),
              onTap: () {
                // _launchFacebook();
              },
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icon/pasos.svg",
                height: 25,
              ),
              trailing: Icon(Icons.download_rounded),
              title: Text('Procesos'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icon/capacitacion.svg",
                height: 25,
              ),
              trailing: Icon(Icons.queue_play_next_rounded),
              title: Text('Capacitaciones'),
              onTap: () {
                //_launchCapa();
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),

            SizedBox(
              height: size.height * 0.22,
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icon/admin.svg",
                height: 25,
              ),
              trailing: Icon(Icons.admin_panel_settings),
              title: Text('Administrador'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
            Divider(),
            //SizedBox(
            //height: size.height * 0.1,
            //),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar Sesion'),
              onTap: () {
                // Update the state of the app
                // ...

                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
