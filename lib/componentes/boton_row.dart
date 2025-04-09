import 'package:flutter/material.dart';
import 'boton.dart';

class BotonRow extends StatelessWidget {
  final List<Boton> botones;
  BotonRow(this.botones);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: botones.fold(<Widget>[], (list, b) {
          list.isEmpty ? list.add(b) : list.addAll([SizedBox(width: 1), b]);
          return list;
        }),
      ),
    );
  }
}
