import 'package:flutter/material.dart';
import 'package:componentes_flutter/src/utils/icon_string_util.dart';
import 'package:componentes_flutter/src/providers/menu_provider.dart';

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

    // Opcion Poco convencional
    // menuProvider.cargarData()
    // .then((res) {
    //   print('Lista');
    //   print(res);
    // });

    // return ListView(
    //   children: _listaItems(),
    // );

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {

        // print('builder');
        // print(snapshot.data);
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {

    // ---  Opcion 2 para el menu ----

    final List<Widget> lista = [];

    data.forEach((item) {
      final widgetTemp = ListTile(
        title: Text(item['texto']),
        leading: getIcon(item['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {

          Navigator.pushNamed(context, item['ruta']);

          // Esta opcion funciona pero es de forma estatica
          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage()
          // );
          // Navigator.push(context, route);
        },
      );

      lista..add(widgetTemp)
           ..add(Divider());
    });

    // --  End opcion 2 para el menu ---

    // ---  Opcion 1 para el menu ----
    // final List<Widget> lista = data.map((item) {
    //   return Column(
    //     children: <Widget>[
    //       ListTile(
    //         title: Text(item['texto']),
    //         leading: Icon(Icons.mood, color: Colors.blue),
    //         trailing: Icon(Icons.keyboard_arrow_right),
    //         onTap: () {},
    //       ),
    //       Divider(),
    //     ],
    //   );
    // }).toList();

    return lista;

    // return [
    //   ListTile(title: Text('item1')),
    //   Divider(),
    //   ListTile(title: Text('item1')),
    //   Divider(),
    //   ListTile(title: Text('item1')),
    //   Divider(),
    // ];
  }

  

}