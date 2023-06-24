import 'package:flutter/material.dart';
import 'questions.dart';
import 'answer_buttons.dart';

// main() {
//   runApp(new perguntasApp());
// }

//tambem pode ser chamado dentro de uma arrow
main() => runApp(const PerguntasApp());

//transformando para statefull
class PerguntaAppState extends State<PerguntasApp> {
  var perguntaSelecionada = 0;

  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': ['Amarelo', 'Azul', 'Vermelho']
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': ['Cachorro', 'Gato', 'Macaco']
    },
  ];

  void _responder() {
    setState(() {
      perguntaSelecionada++;
    });
    debugPrint(perguntas[perguntaSelecionada]['texto'] as String);
  }

  List<Widget> answerWidget = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[perguntaSelecionada]['texto'].toString()),
            AnswerButtons("resposta 01", _responder),
            AnswerButtons("resposta 02", _responder),
            AnswerButtons("resposta 03", _responder)
          ],
        ),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return PerguntaAppState();
  }
}
