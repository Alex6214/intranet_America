import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intranet_americagit/pages/principal/principal_page.dart';

class AddEvent extends StatefulWidget {
  final String fecha;
  final String titulo;
  final String contenido;
  AddEvent(this.fecha, this.titulo, this.contenido);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final myControllerfecha = TextEditingController();
  final myControllertitulo = TextEditingController();
  final myControllercontenido = TextEditingController();

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    myControllerfecha.dispose();
    myControllertitulo.dispose();
    myControllercontenido.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference event = FirebaseFirestore.instance.collection('events');
    Future<void> addEvent() {
      return event.add({
        'fecha': myControllerfecha.text,
        'titulo': myControllertitulo.text,
        'contenido': myControllercontenido.text,
      }).then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PrincipalPageAmerica(),
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
                        controller: myControllertitulo,
                        decoration: InputDecoration(
                          icon: Icon(Icons.title_outlined),
                          labelText: 'Titulo de Evento',
                        ),
                      ),
                      Divider(
                        height: 30,
                      ),
                      TextField(
                        controller: myControllercontenido,
                        decoration: InputDecoration(
                          icon: Icon(Icons.dehaze_outlined),
                          labelText: 'Detalle de Evento',
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
                          onPressed: addEvent,
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

    //ElevatedButton(
    //onPressed: addEvent,
    //child: Text('Add Event'),
    //);
  }
}
