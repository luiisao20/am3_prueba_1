import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Excercise4 extends StatelessWidget {
  const Excercise4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: cities(context));
  }
}

Future<List<dynamic>> getData(String url) async {
  final response = await http.get(Uri.parse(url));

  return json.decode(response.body)['ciudades'];
}

Widget cities(BuildContext context) {
  String url = 'https://jritsqmet.github.io/web-api/ciudades2.json';

  return FutureBuilder(
    future: getData(url),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final data = snapshot.data!;

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return Card(
              child: ListTile(
                onTap: () => seeMoreInfo(context, item),
                title: Text(item['nombre']),
                subtitle: Column(
                  children: [
                    Text(item['provincia']),
                    Text(item['descripcion']),
                  ],
                ),
                leading: SizedBox(
                  width: 100,
                  child: Image.network(
                    item['informacion']['imagen'],
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.warning_rounded, color: Colors.orange),
                  ),
                ),
              ),
            );
          },
        );
      } else {
        return (Text('No hay datos'));
      }
    },
  );
}

void seeMoreInfo(BuildContext context, item) {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Informacion extra'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Actividad principal: ${item['informacion']['actividades'][0]}'),
          Text('Atraccion turistica: ${item['informacion']['atracciones_turisticas'][0]}'),
          Text('Lugar de interes: ${item['informacion']['lugares_interes'][0]}'),
        ],
      ),
    ),
  );
}