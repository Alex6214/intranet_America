import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intranet_americagit/pages/principal/principal_page.dart';
import 'package:intranet_americagit/pages/sales/sale_m.dart';

class SalesPages extends StatefulWidget {
  @override
  _SalesPagesState createState() => _SalesPagesState();
}

class _SalesPagesState extends State<SalesPages> {
  //final Stream<QuerySnapshot> _ventasTotales = FirebaseFirestore.instance
  //   .collection('ventas')
  //.where("cate" ,"==","Mayorista" )
  // .snapshots();

  final Stream<QuerySnapshot> _ventas =
      FirebaseFirestore.instance.collection('totalventas').snapshots();

  @override
  Widget build(BuildContext context) {
    final color = Color(0xff022d4f);
    final size = MediaQuery.of(context).size;

    final style = GoogleFonts.poppins(
        fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold);

    final styletextname = GoogleFonts.poppins(
        fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold);
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
                    builder: (context) => PrincipalPageAmerica(),
                  ));
            },
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Mayoristas(),
                        ),
                      );
                    },
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ventas Mayoristas',
                            style: styletextname,
                          ),
                          Icon(
                            Icons.navigate_next_rounded,
                            size: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Ventas Tiendas',
                          style: styletextname,
                        ),
                        Icon(
                          Icons.navigate_next_rounded,
                          size: 60,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ));
  }
}
