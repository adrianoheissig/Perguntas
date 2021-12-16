import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;

  final void Function()? onPressed;

  const Resposta({Key? key, required this.texto, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        child: Text(texto),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
