import 'package:flutter/material.dart';

class Boton extends StatelessWidget {
  static const OSCURO = Color.fromRGBO(82, 82, 82, 1);
  static const PREDETERMINADO = Color.fromRGBO(112, 112, 112, 1);
  static const OPERADOR = Color.fromRGBO(250, 158, 13, 1);

  final String text;
  final bool grande;
  final Color color;
  final void Function(String) cb;

  Boton({
    required this.text,
    this.grande = false,
    this.color = PREDETERMINADO,
    required this.cb,
  });
  Boton.grande({
    required this.text,
    this.grande = true,
    this.color = PREDETERMINADO,
    required this.cb,
  });
  Boton.operador({
    required this.text,
    this.grande = false,
    this.color = OPERADOR,
    required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: grande ? 2 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: this.color, // Use backgroundColor instead of color
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w200,
          ),
        ),
        onPressed: () => cb(text),
      ),
    );
  }
}
