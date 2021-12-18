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
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Cachorro', 'pontuacao': 8},
        {'texto': 'Cobra', 'pontuacao': 4},
        {'texto': 'Elefante', 'pontuacao': 6}
      ]
    },
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Preto', 'pontuacao': 8},
        {'texto': 'Amarelo', 'pontuacao': 3},
        {'texto': 'Roxo', 'pontuacao': 6},
      ]
    },
    {
      'texto': 'Qual seu time favorito?',
      'respostas': [
        {'texto': 'Corinthians', 'pontuacao': 10},
        {'texto': 'São Paulo', 'pontuacao': 4},
        {'texto': 'Palmeiras', 'pontuacao': 6},
        {'texto': 'Santos', 'pontuacao': 8},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
              : Resultado(
                  pontuacaoTotal: _pontuacaoTotal,
                  reiniciar: _reiniciar,
                )),
    );
  }
}
