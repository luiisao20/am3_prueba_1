import 'package:flutter/material.dart';

bool showInfo = false;

class Excercise1 extends StatefulWidget {
  const Excercise1({super.key});

  @override
  State<Excercise1> createState() => _Excercise1State();
}

class _Excercise1State extends State<Excercise1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Ejercicio 1'),
            Text(
              'Da clic en el icono para mostrar informacion',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            setState(() {
              showInfo = !showInfo;
            });
          },
          icon: showInfo
              ? Icon(Icons.arrow_upward)
              : Icon(Icons.arrow_downward),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          info(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset('assets/exc1.jpg'),
          ),
        ],
      ),
    );
  }
}

Widget info() {
  if (!showInfo) return (Text(''));
  return Center(
    child: (Column(
      // mainAxisSize: .max,
      children: [
        Text('Ejercicios de Software', style: TextStyle(fontSize: 25)),
        Text('Programador: Luis Bravo', style: TextStyle(fontSize: 25)),
        Text('Carrera: Desarrollo de software', style: TextStyle(fontSize: 25)),
      ],
    )),
  );
}
