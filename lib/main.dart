import 'package:flutter/material.dart';
import 'package:prueba_1/screens/excercise_1.dart';
import 'package:prueba_1/screens/excercise_2.dart';
import 'package:prueba_1/screens/excercise_3.dart';
import 'package:prueba_1/screens/excercise_4.dart';

void main() {
  runApp(const BottomNavigation());
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Body(), debugShowCheckedModeBanner: false);
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int index = 0;
  List<Widget> pages = [Excercise1(), Excercise2(), Excercise3(), Excercise4()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() {
          index = value;
        }),
        backgroundColor: Colors.blueGrey,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            backgroundColor: Colors.amber,
            label: 'Ejercicio 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            backgroundColor: Colors.amber,
            label: 'Ejercicio 2',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information),
            backgroundColor: Colors.amber,
            label: 'Ejercicio 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            backgroundColor: Colors.amber,
            label: 'Ejercicio 4',
          ),
        ],
      ),
    );
  }
}
