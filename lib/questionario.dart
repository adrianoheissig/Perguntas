import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({
    Key? key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  }) : super(key: key);

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    List<Widget> widgets = respostas
        .map((resp) => Resposta(
              texto: resp['texto'].toString(),
              onPressed: () =>
                  (responder(int.parse(resp['pontuacao'].toString()))),
            ))
        .toList();

    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]['texto'].toString()),
        ...widgets
      ],
    );
  }
}
