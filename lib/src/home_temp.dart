import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final items = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _createItems()
      ),
    );
  }

List<Widget> _createItems () {

  List<Widget> lista = new List<Widget>();

  for (String opt in items) {
    final tempWidget = new ListTile(
      title: Text(opt),
    );

    lista.add(tempWidget);
    lista.add(Divider());
  }

  return lista;
}

}
