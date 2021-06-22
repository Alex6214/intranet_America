import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intranet_americagit/pages/sales/sales_page.dart';

class Tiendas extends StatefulWidget {
  const Tiendas({Key? key}) : super(key: key);

  @override
  _TiendasState createState() => _TiendasState();
}

class _TiendasState extends State<Tiendas> {
  final Stream<QuerySnapshot> _mayStream =
      FirebaseFirestore.instance.collection('tiendas').snapshots();
  @override
  Widget build(BuildContext context) {
    final color = Color(0xff022d4f);
    //final size = MediaQuery.of(context).size;
    // final style = GoogleFonts.poppins(
    // fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold);

    final styletextname = GoogleFonts.poppins(
        fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold);

    final styletexttabla =
        GoogleFonts.roboto(fontSize: 20.0, color: Colors.black);

    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/image/Logo.JPG',
            height: 50,
          ),
          centerTitle: true,
          backgroundColor: color,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            child: Icon(Icons.reply_outlined),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SalesPages(),
                  ));
            },
          ),
        ),
        body: BounceInDown(
          duration: Duration(seconds: 3),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    'Vendedor',
                    style: styletextname,
                  ),
                  Spacer(),
                  Text(
                    'Meta     ',
                    style: styletextname,
                  ),
                  Spacer(),
                  Text(
                    '   Avance',
                    style: styletextname,
                  ),
                  Spacer(),
                  Text(
                    'Porcentaje',
                    style: styletextname,
                  ),
                  Spacer(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: StreamBuilder<QuerySnapshot>(
                    stream: _mayStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      return new ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          final porcentaje = document['porcentaje'];

                          Widget ond = Text('');

                          if (porcentaje >= 100) {
                            ond = Text(
                              '${porcentaje.toString()} %',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            );
                          }
                          if (porcentaje < 100) {
                            ond = Text(
                              '${porcentaje.toString()} %',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            );
                          }

                          return Container(
                            decoration: BoxDecoration(border: Border()),
                            child: Column(
                              children: [
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Spacer(),
                                    Text(
                                      ' ${document['name']}',
                                      style: styletexttabla,
                                    ),
                                    Spacer(),
                                    Text(' S/ ${document['meta']}',
                                        style: styletexttabla),
                                    Spacer(),
                                    Text(' S/ ${document['avance']}',
                                        style: styletexttabla),
                                    Spacer(),
                                    ond,
                                    Spacer()
                                  ],
                                ),
                              ],
                            ),
                          );
                          //Text(document.data().toString());
                        }).toList(),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
