import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intranet_americagit/logic/services_firebase.dart';
import 'package:intranet_americagit/pages/principal/principal_page.dart';
// ignore: unused_import
import 'package:intranet_americagit/pages/testing/testadd.dart';
import 'package:intranet_americagit/pages/testing/testauth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final myControlleremail = TextEditingController();
  final myControllerpassword = TextEditingController();

  final AuthService _authCredential = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  String email = '';
  String pass = '';
  String error = '';

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
    final styleTitule = GoogleFonts.poppins(
        fontSize: 26.0, color: Colors.black, fontWeight: FontWeight.bold);
    final styletext = GoogleFonts.poppins(
        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold);

    final styleForm = GoogleFonts.poppins(
        fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold);
    //final size = MediaQuery.of(context).size;
    // const color = const Color(0xff022d4f);
    return StreamBuilder<FirebaseAuth>(builder: (context, snapshot) {
      return Scaffold(
        body: snapshot.data != null
            ? PrincipalPageAmerica()
            : SingleChildScrollView(
                child: FadeInLeft(
                  duration: Duration(seconds: 2),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 80, left: 20, right: 20),
                          child: SvgPicture.asset(
                            'assets/icon/login.svg',
                            height: 280,
                          ),
                        ),
                        Text(
                          'Bienvenido',
                          style: styleTitule,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'Correo electronico'),
                                    validator: (val) => val!.isEmpty
                                        ? 'Ingresa un correo'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    },
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'Contraseña',
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _showPassword = !_showPassword;
                                            });
                                          },
                                          child: Icon(_showPassword
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                        )),
                                    obscureText: !_showPassword,
                                    validator: (val) => val!.length < 6
                                        ? 'Password muy corto debe ser de 6+ caracteres'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => pass = val);
                                    },
                                  )
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                bool succes = await _authCredential
                                    .signInUserWithEmailAndPassword(
                                        email, pass);
                                if (!succes) {
                                  setState(() {
                                    error = 'Sucedio un error';
                                  });
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PrincipalPageAmerica(),
                                      ));
                                }
                              }
                            },
                            child: Text(
                              'ingresar',
                              style: styletext,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
