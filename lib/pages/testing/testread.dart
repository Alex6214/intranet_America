import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventInformation extends StatefulWidget {
  @override
  _EventInformationState createState() => _EventInformationState();
}

class _EventInformationState extends State<EventInformation> {
  final Stream<QuerySnapshot> _eventStream =
      FirebaseFirestore.instance.collection('events').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _eventStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading');
          }

          return new ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return new ListTile(
                  // title: new Text(document.data()['fecha']),
                  // subtitle: new Text(document.data()['titulo']),
                  );
            }).toList(),
          );
        });
  }
}
