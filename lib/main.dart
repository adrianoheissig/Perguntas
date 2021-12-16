import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntasApp());

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({Key? key}) : super(key: key);

  @override
  _PerguntasAppState createState() => _PerguntasAppState();
}

class _PerguntasAppState extends State<PerguntasApp> {
  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': ['Gato', 'Cachorro', 'Cobra', 'Elefante']
    },
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': ['Azul', 'Preto', 'Amarelo', 'Roxo']
    },
    {
      'texto': 'Qual seu time favorito?',
      'respostas': ['Corinthians', 'São Paulo', 'Palmeiras', 'Santos']
    }
  ];

  var _perguntaSelecionada = 0;

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perguntas App - Treinamento',
      home: Scaffold(
          appBar: AppBar(
            title: const Text("App Perguntas"),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder,
                )
              : const Resultado()),
    );
  }
}
