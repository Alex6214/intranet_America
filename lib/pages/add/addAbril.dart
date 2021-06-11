import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_americagit/pages/birthday/abril/abril.dart';

class AddAbril extends StatefulWidget {
  final String fecha;
  final String sede;
  final String nombres;

  AddAbril(this.fecha, this.sede, this.nombres);

  @override
  _AddAbrilState createState() => _AddAbrilState();
}

class _AddAbrilState extends State<AddAbril> {
  final myControllerfecha = TextEditingController();
  final myControllersede = TextEditingController();
  final myControllernombres = TextEditingController();
  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    myControllerfecha.dispose();
    myControllersede.dispose();
    myControllernombres.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference eventAbril =
        FirebaseFirestore.instance.collection('abril');
    Future<void> addAbril() {
      return eventAbril.add({
        'fecha': myControllerfecha.text,
        'sede': myControllersede.text,
        'nombres': myControllernombres.text,
      }).then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Abril(),
            ));
        print("Event Added");
        // ignore: invalid_return_type_for_catch_error
      }).catchError((error) => print("Failed to add event : $error"));
    }

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
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  child: Column(
                    children: [
                      TextField(
                        controller: myControllerfecha,
                        decoration: InputDecoration(
                          icon: Icon(Icons.date_range),
                          labelText: 'Fecha de Evento',
                        ),
                      ),
                      Divider(
                        height: 30,
                      ),
                      TextField(
                        controller: myControllersede,
                        decoration: InputDecoration(
                          icon: Icon(Icons.title_outlined),
                          labelText: 'Sede',
                        ),
                      ),
                      Divider(
                        height: 30,
                      ),
                      TextField(
                        controller: myControllernombres,
                        decoration: InputDecoration(
                          icon: Icon(Icons.dehaze_outlined),
                          labelText: 'Nombres del Trabajados',
                        ),
                      ),
                      Divider(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black54, // background
                              onPrimary: Colors.white,
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ) // foreground
                              ),
                          onPressed: addAbril,
                          child: Text(' Agregar ')),
                      Text('')
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
