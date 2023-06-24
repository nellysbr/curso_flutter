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

  final List<Map<String, Object>> _perguntas = [
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
    // print(_perguntas[perguntaSelecionada].cast()['respostas'].toString());
    // Result(_perguntas[perguntaSelecionada].cast()['respostas']);
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
              : const Result()),
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
