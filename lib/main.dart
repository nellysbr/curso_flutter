import 'package:flutter/material.dart';
import 'result.dart';
import 'form.dart';

// main() {
//   runApp(new perguntasApp());
// }

//tambem pode ser chamado dentro de uma arrow
main() => runApp(const PerguntasApp());

//transformando para statefull
class PerguntaAppState extends State<PerguntasApp> {
  var perguntaSelecionada = 0;
  var totalPoints = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Amarelo', 'nota': 10},
        {'texto': 'Azul', 'nota': 2},
        {'texto': 'Vermelho', 'nota': 5},
      ]
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Macaco', 'nota': 8},
        {'texto': 'Gato', 'nota': 6},
        {'texto': 'Cachorro', 'nota': 10},
      ]
    },
  ];

  void _responder(int points) {
    setState(() {
      perguntaSelecionada++;
      totalPoints += points;
    });
    // print(_perguntas[perguntaSelecionada].cast()['respostas'].toString());
    // Result(_perguntas[perguntaSelecionada].cast()['respostas']);
  }

  void _resetApp() {
    setState(() {
      perguntaSelecionada = 0;
      totalPoints = 0;
    });
  }

  bool get hasQuestion {
    return perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
          ),
          body: hasQuestion
              ? FormApp(
                  perguntas: _perguntas,
                  responder: _responder,
                  perguntaSelecionada: perguntaSelecionada)
              : Result(_resetApp, totalPoints)),
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
