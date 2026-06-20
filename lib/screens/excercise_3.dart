import 'package:flutter/material.dart';

class Excercise3 extends StatefulWidget {
  const Excercise3({super.key});

  @override
  State<Excercise3> createState() => _Excercise3State();
}

class _Excercise3State extends State<Excercise3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisSize: .min,
            children: [
              Center(
                child: Text(
                  'Determinar la presión arterial media (PAM) para evaluar perfusión tisular',
                ),
              ),
              form(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget form(BuildContext context) {
  TextEditingController pressDiast = TextEditingController();
  TextEditingController pressSis = TextEditingController();
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: (Column(
      spacing: 10,
      children: [
        TextField(
          controller: pressDiast,
          keyboardType: TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            label: Text('Ingresa la presión diastólica en mmHg'),
          ),
        ),
        TextField(
          controller: pressSis,
          keyboardType: TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            label: Text('Ingresa la presión sistólica en mmHg'),
          ),
        ),
        ElevatedButton(
          onPressed: () => calculate(pressDiast.text, pressSis.text, context),
          child: Text('Obtener resultados'),
        ),
      ],
    )),
  );
}

void calculate(String pressDiast, String pressSis, BuildContext context) {
  if (pressDiast.trim().isEmpty || pressSis.trim().isEmpty) {
    showDialog(
      context: context,
      builder: ((context) => AlertDialog(
        title: Text('Error'),
        content: Text('Existen datos vacios'),
      )),
    );
    return;
  }
  try {
    double pressDiastVal = double.parse(pressDiast);
    double pressSisVal = double.parse(pressSis);

    if (pressSisVal < pressDiastVal) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('error'),
          content: Text(
            'La presión sistólica no puede ser menor a la presión diastólica',
          ),
        ),
      );
      return;
    }

    double result = pressDiastVal + (pressSisVal - pressDiastVal) / 3;

    showDialog(
      context: context,
      builder: ((context) => AlertDialog(
        title: Text('Resultado'),
        content: Text('La perfusión tisular es: ${result.toStringAsFixed(2)}'),
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
