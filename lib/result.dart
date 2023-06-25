import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalPoints;
  final void Function() resetForm;
  const Result(this.resetForm, this.totalPoints, {super.key});

  String get points {
    return totalPoints.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Parabéns!\nvocê fez $points pontos!',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: resetForm,
            child: const Text("reiniciar"),
          ),
        )
      ],
    );
  }
  //
}
