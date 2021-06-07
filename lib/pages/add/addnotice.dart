import 'package:flutter/material.dart';

class AddNotice extends StatefulWidget {
  const AddNotice({Key? key}) : super(key: key);

  @override
  _AddNoticeState createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNotice> {
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
        backgroundColor: color,
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
                        decoration: InputDecoration(
                          icon: Icon(Icons.date_range),
                          labelText: 'Fecha de Evento',
                        ),
                      ),
                      Divider(
                        height: 30,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.title_outlined),
                          labelText: 'Titulo de Evento',
                        ),
                      ),
                      Divider(
                        height: 30,
                      ),
                      TextField(
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
                              primary: Colors.red, // background
                              onPrimary: Colors.white,
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ) // foreground
                              ),
                          onPressed: () {},
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
