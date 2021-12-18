import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;
  final Function()? reiniciar;
  const Resultado({Key? key, this.pontuacaoTotal = 0, this.reiniciar})
      : super(key: key);

  String get fraseResultado {
    if (pontuacaoTotal < 8) {
      return 'Parabéns';
    } else if (pontuacaoTotal < 12) {
      return 'Você é bom!';
    } else if (pontuacaoTotal < 16) {
      return 'Impressionante';
    } else {
      return 'Nivel Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
                fontSize: 28, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          onPressed: reiniciar,
          child: const Text(
            'Reiniciar',
          ),
        )
      ],
    );
  }
}
