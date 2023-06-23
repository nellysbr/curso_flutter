import 'package:flutter/material.dart';

// main() {
//   runApp(new perguntasApp());
// }

//tambem pode ser chamado dentro de uma arrow
main() => runApp(const PerguntasApp());

//transformando para statefull
class PerguntaAppState extends State<PerguntasApp> {
  var perguntaSelecionada = 0;

  final List<String> perguntas = [
    'Qual sua cor favorita?',
    'qual e o seu animal favorito?',
  ];

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    debugPrint('Respondeu a pergunta');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas.elementAt(perguntaSelecionada)),
            ElevatedButton(onPressed: responder, child: const Text('Amarelo')),
            ElevatedButton(onPressed: responder, child: const Text('Vermelho')),
            ElevatedButton(onPressed: responder, child: const Text('Laranja')),
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
