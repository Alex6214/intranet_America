// ignore: unused_import
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intranet_americagit/logic/services_firebase.dart';
import 'package:intranet_americagit/pages/add/addEvent.dart';
// ignore: unused_import
import 'package:intranet_americagit/pages/birthday/months.dart';
import 'package:intranet_americagit/pages/login/loginscrenn.dart';
import 'package:intranet_americagit/pages/sales/sales_page.dart';
//import 'package:intranet_americagit/pages/login/loginscrenn.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
//import 'dart:async';

class PrincipalPageAmerica extends StatefulWidget {
  const PrincipalPageAmerica({Key? key}) : super(key: key);

  @override
  _PrincipalPageAmericaState createState() => _PrincipalPageAmericaState();
}

String error = '';
String codadmin = '';
final _formKey = GlobalKey<FormState>();
bool _showPassword = false;
final AuthService _authService = AuthService();

String tc = '3.85';

bool _visibility = true;

class _PrincipalPageAmericaState extends State<PrincipalPageAmerica> {
  final Stream<QuerySnapshot> _eventStream = FirebaseFirestore.instance
      .collection('events')
      .orderBy('fecha', descending: true)
      .snapshots();

  CollectionReference tcweb = FirebaseFirestore.instance.collection('tc');

  final Stream<QuerySnapshot> _tc =
      FirebaseFirestore.instance.collection('tc').snapshots();

  @override
  Widget build(BuildContext context) {
    final color = Color(0xff022d4f);
    final size = MediaQuery.of(context).size;
    final style = GoogleFonts.poppins(
        fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold);

    final styletextname = GoogleFonts.poppins(
        fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold);

    final styletexttc = GoogleFonts.poppins(
        fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold);

    return Scaffold(
      endDrawer: Drawer(
        child: Enddrawerlist(size: size),
      ),
      appBar: AppBar(
        title: Image.asset(
          'assets/image/Logo.JPG',
          height: 50,
        ),
        backgroundColor: color,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: _tc,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return new ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                  // ignore: unused_local_variable
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7, left: 10),
                        child: GestureDetector(
                          onDoubleTap: () => _showTC(context),
                          child: Container(
                            height: 50,
                            width: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'TC: ',
                                  style: styletexttc,
                                ),
                                Text(
                                  document['tc'],
                                  style: styletexttc,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: color),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 30, top: 7),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: color),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Noticias de  Maderas America',
                                  style: styletexttc,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }).toList());
              }),
          Padding(
            padding: const EdgeInsets.only(top: 55),
            child: StreamBuilder<QuerySnapshot>(
                stream: _eventStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return new ListView(
                    reverse: false,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ZoomIn(
                          child: Container(
                            width: size.width,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.black26),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 50, left: 50),
                                  child: Row(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.title,
                                            color: color,
                                          ),
                                          Text(
                                            document['titulo'],
                                            style: style,
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.event_available,
                                            color: color,
                                          ),
                                          Text(
                                            document['fecha'],
                                            style: style,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.text_snippet,
                                        color: color,
                                      ),
                                      Text(
                                        document['contenido'],
                                        style: styletextname,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                        onTap: () async {
                                          final _urlLink = document['link'];
                                          if (await _urlLink == '') {
                                            setState(() {
                                              _visibility = !_visibility;
                                            });
                                          } else if (await canLaunch(
                                              _urlLink)) {
                                            await launch(_urlLink);
                                          } else {
                                            throw 'Could not launch $_urlLink';
                                          }
                                        },
                                        child: Visibility(
                                            visible: _visibility,
                                            child: Icon(Icons.link))),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                      //Text(document.data().toString());
                    }).toList(),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        elevation: 30,
        child: Icon(Icons.add_box_outlined),
        onPressed: () {
          _showAdmin(context);
        },
      ),
    );
  }

  void _showAdmin(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BounceInDown(
            duration: Duration(seconds: 2),
            child: AlertDialog(
              content: Container(
                height: 130,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ingrese Codigo Administrador'),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Codigo',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(_showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        obscureText: !_showPassword,
                        validator: (val) =>
                            val!.isEmpty ? 'Ingresa codigo Porfavor' : null,
                        onChanged: (val) {
                          setState(() => codadmin = val);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Si el formulario es válido, queremos mostrar un Snackbar
                            if (codadmin == 'sistemas6214') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddEvent('', '', ''),
                                  ));
                            }
                          }
                        },
                        child: Text('Administrador'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void _showTC(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BounceInDown(
            duration: Duration(seconds: 2),
            child: AlertDialog(
              content: Container(
                height: 130,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ingrese Nuevo Tipo de Cambio'),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Tipo de Cambio',
                        ),
                        obscureText: false,
                        validator: (val) =>
                            val!.isEmpty ? 'Ingresa codigo Porfavor' : null,
                        onChanged: (val) {
                          setState(() => tc = val);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            return tcweb
                                .doc('wgFEZpRC8fOuCiNqokSL')
                                .update({'tc': tc})
                                .then((value) => Navigator.pop(context))
                                .catchError((error) => print("Error"));
                          }

                          // Si el formulario es válido, queremos mostrar un Snackbar
                        },
                        child: Text('Cambiar'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class Enddrawerlist extends StatefulWidget {
  const Enddrawerlist({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _EnddrawerlistState createState() => _EnddrawerlistState();
}

class _EnddrawerlistState extends State<Enddrawerlist> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      //padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: SvgPicture.asset(
            "assets/icon/drawer.svg",
            height: widget.size.height * 0.30,
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
            _launchURIT();
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
            _launchCapas();
            //_launchCapa();
            // Update the state of the app
            // ...
            // Then close the drawer
            //Navigator.pop(context);
          },
        ),
        Divider(),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icon/cake.svg",
            height: 25,
          ),
          trailing: Icon(Icons.people_sharp),
          title: Text('Cumpleaños'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Mounths()),
            );
            //_launchCapa();
            // Update the state of the app
            // ...
            // Then close the drawer
            //Navigator.pop(context);
          },
        ),
        Divider(),
        ListTile(
          leading: SvgPicture.asset(
            "assets/icon/ventas.svg",
            height: 25,
          ),
          trailing: Icon(Icons.verified_rounded),
          title: Text('Ventas'),
          onTap: () {
            _showAdminVentas(context);
            //_launchCapa();
            // Update the state of the app
            // ...
            // Then close the drawer
            //Navigator.pop(context);
          },
        ),

        SizedBox(
          height: widget.size.height * 0.15,
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ));
            _authService.logout();
            // Update the state of the app
            // ...

            //Navigator.pop(context);
          },
        ),
      ],
    );
  }

  void _showAdminVentas(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BounceInDown(
            duration: Duration(seconds: 2),
            child: AlertDialog(
              content: Container(
                height: 130,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ingrese Codigo Administrador'),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Codigo',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(_showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        obscureText: !_showPassword,
                        validator: (val) =>
                            val!.isEmpty ? 'Ingresa codigo Porfavor' : null,
                        onChanged: (val) {
                          setState(() => codadmin = val);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Si el formulario es válido, queremos mostrar un Snackbar
                            if (codadmin == 'ventas2021') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SalesPages(),
                                  ));
                            }
                          }
                        },
                        child: Text('Administrador'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

void _launchURIT() async {
  const _urlRIT =
      'https://mega.nz/file/okhEjbYR#_hseQaBq4zFczfqtxYO37kVVY8_-ErB6VidUlOrwy3U';
  if (await canLaunch(_urlRIT)) {
    await launch(_urlRIT);
  } else {
    throw 'Could not launch $_urlRIT';
  }
}

void _launchCapas() async {
  const _urlRIT = 'https://mega.nz/folder/49hC3ZTS#L5gJQL2s4ph7-Nkpe8mhNg';
  if (await canLaunch(_urlRIT)) {
    await launch(_urlRIT);
  } else {
    throw 'Could not launch $_urlRIT';
  }
}
