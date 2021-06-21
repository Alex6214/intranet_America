import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intranet_americagit/pages/sales/sales_page.dart';

class Mayoristas extends StatefulWidget {
  const Mayoristas({Key? key}) : super(key: key);

  @override
  _MayoristasState createState() => _MayoristasState();
}

class _MayoristasState extends State<Mayoristas> {
  final Stream<QuerySnapshot> _mayStream =
      FirebaseFirestore.instance.collection('mayoristas').snapshots();
  @override
  Widget build(BuildContext context) {
    final color = Color(0xff022d4f);
    final size = MediaQuery.of(context).size;
    final style = GoogleFonts.poppins(
        fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold);

    final styletextname = GoogleFonts.poppins(
        fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);
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
      body: StreamBuilder<QuerySnapshot>(
          stream: _mayStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return new ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ZoomIn(
                    duration: Duration(seconds: 2),
                    child: Container(
                      width: size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [Colors.black38, Colors.white12],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 50, left: 50),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.date_range_outlined,
                                        color: color,
                                      ),
                                      Text(
                                        document['name'],
                                        style: style,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.local_convenience_store_rounded,
                                        color: color,
                                      ),
                                      Text(
                                        document['meta'],
                                        style: style,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: color,
                                ),
                                Text(
                                  document['avance'],
                                  style: styletextname,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
                //Text(document.data().toString());
              }).toList(),
            );
          }),
    );
  }
}
