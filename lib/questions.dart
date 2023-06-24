import 'package:flutter/material.dart';

//Container widget - existe um componente dentro do container chamado child (conteudo)
// padding - espacamento dentro do container

class Questao extends StatelessWidget {
  final String texto;

  const Questao(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(7),
      // margin: EdgeInsets.fromLTRB(left, top, right, bottom), usado se quiser aplicar margem personalizada em diferentes pontos
      child: Text(
        texto,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
