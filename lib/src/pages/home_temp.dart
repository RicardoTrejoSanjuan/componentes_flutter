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
        children: _createItemShort()
          // children: _createItems()
          ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> lista = new List<Widget>();

    for (String opt in items) {
      final tempWidget = new ListTile(
        title: Text(opt),
      );

      lista..add(tempWidget)..add(Divider());
    }

    return lista;
  }

  List<Widget> _createItemShort() {
    return items.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text(item),
            leading: Icon(Icons.accessibility_new),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () { },
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
