import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_americagit/pages/birthday/mayo/mayo.dart';

class AddMayo extends StatefulWidget {
  final String fecha;
  final String sede;
  final String nombres;

  AddMayo(this.fecha, this.sede, this.nombres);

  @override
  _AddMayoState createState() => _AddMayoState();
}

class _AddMayoState extends State<AddMayo> {
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
    CollectionReference eventMayo =
        FirebaseFirestore.instance.collection('mayo');
    Future<void> addMayo() {
      return eventMayo.add({
        'fecha': myControllerfecha.text,
        'sede': myControllersede.text,
        'nombres': myControllernombres.text,
      }).then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Mayo(),
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
                          labelText: 'Fecha de Cumpleaños',
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
                          labelText: 'Nombres del Trabajador',
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
                          onPressed: addMayo,
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
