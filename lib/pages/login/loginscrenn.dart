import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intranet_americagit/pages/principal/principal_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const color = const Color(0xff022d4f);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
                child: SvgPicture.asset(
                  'assets/icon/login.svg',
                  height: 280,
                ),
              ),
              Text('Bienvenido'),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Correo electronico'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Contraseña'),
                    )
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrincipalPageAmerica(),
                          ));
                    },
                    child: Text('ingresar')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
