import 'package:flutter/material.dart';
import 'boton_row.dart';
import 'boton.dart';

class Teclado extends StatelessWidget {
  final void Function(String) cb;

  Teclado(this.cb);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: <Widget>[
          BotonRow([
            Boton.grande(text: 'AC', cb: cb),
            Boton.operador(text: '%', cb: cb),
            Boton.operador(text: '/', cb: cb),
          ]),
          SizedBox(height: 1),
          BotonRow([
            Boton(text: '7', cb: cb),
            Boton(text: '8', cb: cb),
            Boton(text: '9', cb: cb),
            Boton.operador(text: 'x', cb: cb),
          ]),
          SizedBox(height: 1),
          BotonRow([
            Boton(text: '4', cb: cb),
            Boton(text: '5', cb: cb),
            Boton(text: '6', cb: cb),
            Boton.operador(text: '-', cb: cb),
          ]),
          SizedBox(height: 1),
          BotonRow([
            Boton(text: '1', cb: cb),
            Boton(text: '2', cb: cb),
            Boton(text: '3', cb: cb),
            Boton.operador(text: '+', cb: cb),
          ]),
          SizedBox(height: 1),
          BotonRow([
            Boton.grande(text: '0', cb: cb),
            Boton(text: '.', cb: cb),
            Boton(text: '=', cb: cb),
          ]),
        ],
      ),
    );
  }
}
