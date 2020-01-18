import 'package:flutter/material.dart';
import 'package:componentes_flutter/src/pages/providers/menu_provider.dart';

class HomePages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    print(menuProvider.opciones);
    
    return ListView(
      children: _listaItems(),
    );
  }

  List<Widget> _listaItems() {
    return [
      ListTile(title: Text('item1')),
      Divider(),
      ListTile(title: Text('item1')),
      Divider(),
      ListTile(title: Text('item1')),
      Divider(),
    ];
  }

  

}