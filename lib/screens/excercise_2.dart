import 'package:flutter/material.dart';

class Excercise2 extends StatefulWidget {
  const Excercise2({super.key});

  @override
  State<Excercise2> createState() => _Excercise2State();
}

class _Excercise2State extends State<Excercise2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisSize: .min,
            children: [Text('Ingresa los datos de la cuenta'), form(context)],
          ),
        ),
      ),
    );
  }
}

Widget form(BuildContext context) {
  TextEditingController total = TextEditingController();
  TextEditingController people = TextEditingController();
  TextEditingController tip = TextEditingController();
  TextEditingController tipValue = TextEditingController();
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: (Column(
      spacing: 10,
      children: [
        TextField(
          controller: total,
          keyboardType: TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            label: Text('Ingresa el total de la cuenta'),
          ),
        ),
        TextField(
          controller: people,
          keyboardType: TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            label: Text('Ingresa el numero total de personas'),
          ),
        ),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: TextField(
                controller: tip,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  label: Text('¿Existe propina? (si/no)'),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                enabled: tip.text == 'si',
                controller: tipValue,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  label: Text('Valor de la propina (%)'),
                ),
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () => calculate(
            total.text,
            people.text,
            tip.text,
            tipValue.text,
            context,
          ),
          child: Text('Obtener resultados'),
        ),
      ],
    )),
  );
}

void calculate(
  String total,
  String people,
  String tip,
  String tipValue,
  BuildContext context,
) {
  try {
    double totalValue;
    if (tip == 'si') {
      totalValue = double.parse(total) * (1 + int.parse(tipValue) / 100);
    }
    totalValue = double.parse(total);
    double cuota = totalValue / int.parse(people);

    showDialog(
      context: context,
      builder: ((context) => AlertDialog(
        title: Text('Resultado'),
        content: Text('Cada persona debe pagar ${cuota.toStringAsFixed(2)}'),
      )),
    );
  } catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('error'),
        content: Text('Existio un error, revisa los datos'),
      ),
    );
  }
}
