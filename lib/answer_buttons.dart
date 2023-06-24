import 'package:flutter/material.dart';

class AnswerButtons extends StatelessWidget {
  final String respostas;
  final void Function() selectedQuestions;

  const AnswerButtons(this.respostas, this.selectedQuestions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
        onPressed: selectedQuestions,
        child: Text(
          respostas,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
