import 'package:flutter/material.dart';
import 'question.dart';
import 'answer_buttons.dart';

class FormApp extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

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
    List<Map<String, Object>> answers = hasQuestion
        ? perguntas[perguntaSelecionada].cast()['respostas']
            as List<Map<String, Object>> //nao precisa dessa ultima parte
        : [];
    //map dos valores dessa lista e invocando os botoes
    List<Widget> widgetButtons = answers
        .map((res) => AnswerButtons(res['texto'].toString(),
            () => responder(int.parse(res['nota'].toString()))))
        .toList();

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...widgetButtons,
      ],
    );
  }
}
