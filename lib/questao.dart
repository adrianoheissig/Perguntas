import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  const Questao({Key? key, this.texto = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
