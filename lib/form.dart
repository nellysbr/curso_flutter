import 'package:flutter/material.dart';
import 'question.dart';
import 'answer_buttons.dart';

class FormApp extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function() responder;

  const FormApp({
    super.key,
    required this.perguntas,
    required this.responder,
    required this.perguntaSelecionada,
  });

  bool get hasQuestion {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //cria uma lista passando por todas as respostas
    List<String> answers =
        hasQuestion ? perguntas[perguntaSelecionada].cast()['respostas'] : [];
    //map dos valores dessa lista e invocando os botoes
    List<Widget> widgetButtons =
        answers.map((e) => AnswerButtons(e, responder)).toList();

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...widgetButtons,
      ],
    );
  }
}
