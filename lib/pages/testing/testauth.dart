import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final myControlleremail = TextEditingController();
  final myControllerpassword = TextEditingController();

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    myControlleremail.dispose();
    myControllerpassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        controller: myControlleremail,
                        decoration: InputDecoration(
                          icon: Icon(Icons.date_range),
                          labelText: 'Email',
                        ),
                      ),
                      Divider(
                        height: 30,
                      ),
                      TextField(
                        controller: myControllerpassword,
                        decoration: InputDecoration(
                          icon: Icon(Icons.title_outlined),
                          labelText: 'Password',
                        ),
                      ),
                      Divider(
                        height: 30,
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
                          onPressed: () {},
                          child: Text(' Crear User ')),
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
