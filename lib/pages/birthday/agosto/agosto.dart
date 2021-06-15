import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_americagit/pages/add/addAgosto.dart';
import 'package:intranet_americagit/pages/birthday/months.dart';

class Agosto extends StatefulWidget {
  const Agosto({Key? key}) : super(key: key);

  @override
  _AgostoState createState() => _AgostoState();
}

String codadmin = '';
final _formKey = GlobalKey<FormState>();

//bool _showPassword = false;

class _AgostoState extends State<Agosto> {
  final Stream<QuerySnapshot> _eventStream =
      FirebaseFirestore.instance.collection('agosto').snapshots();
  @override
  Widget build(BuildContext context) {
    final color = Color(0xff022d4f);
    final size = MediaQuery.of(context).size;
    final style = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19);
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

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ZoomIn(
                    duration: Duration(seconds: 2),
                    child: Container(
                      width: size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [Colors.white10, Colors.white12],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 50, left: 50),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: color,
                                    ),
                                    Text(
                                      document['nombres'],
                                      style: style,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.date_range_outlined,
                                      color: color,
                                    ),
                                    Text(
                                      document['fecha'],
                                      style: style,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.local_convenience_store_rounded,
                                      color: color,
                                    ),
                                    Text(
                                      document['sede'],
                                      style: style,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
        child: Icon(Icons.person_add),
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
                        obscureText: true,
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
                                    builder: (context) => AddAgosto('', '', ''),
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
