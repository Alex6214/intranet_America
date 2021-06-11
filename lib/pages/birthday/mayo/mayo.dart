import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_americagit/pages/add/addMayo.dart';
import 'package:intranet_americagit/pages/birthday/months.dart';

class Mayo extends StatefulWidget {
  const Mayo({Key? key}) : super(key: key);

  @override
  _MayoState createState() => _MayoState();
}

String codadmin = '';
final _formKey = GlobalKey<FormState>();

class _MayoState extends State<Mayo> {
  final Stream<QuerySnapshot> _eventStream =
      FirebaseFirestore.instance.collection('mayo').snapshots();
  String codadmin = '';
  @override
  Widget build(BuildContext context) {
    final color = Color(0xff022d4f);
    final size = MediaQuery.of(context).size;
    final style = TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/image/Logo.JPG',
          height: 50,
        ),
        centerTitle: true,
        backgroundColor: Colors.black26,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          child: Icon(Icons.reply_outlined),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Mounths(),
                ));
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _eventStream,
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
                  child: Container(
                    width: size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black26),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50, left: 50),
                          child: Row(
                            children: [
                              Text(document['sede']),
                              Spacer(),
                              Text(document['fecha']),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(document['nombres']),
                        ),
                      ],
                    ),
                  ),
                );
                //Text(document.data().toString());
              }).toList(),
            );
          }),
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
          return AlertDialog(
            content: Container(
              height: 130,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ingrese Codigo Administrador'),
                    TextFormField(
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
                                  builder: (context) => AddMayo('', '', ''),
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
          );
        });
  }
}
