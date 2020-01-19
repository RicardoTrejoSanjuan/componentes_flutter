import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Caminar';

  List<String> _verbos = ['Correr', 'Caminar', 'Volar', 'Nadar', 'Conducir'];

  TextEditingController _inputFielDateControlles = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0
        ),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon(Icons.insert_emoticon),
        icon: Icon(Icons.person)
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
          print(_nombre);
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email de la persona',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor) => setState(() {
          _email = valor;
      }),
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor) => setState(() {
          _password = valor;
      }),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFielDateControlles,
      decoration: InputDecoration(
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2019),
      lastDate: new DateTime(2022),
      locale: Locale('es', 'ES')
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFielDateControlles.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown() {
    List<DropdownMenuItem<String>> lista = new List();

    _verbos.forEach((item) {
      lista.add(DropdownMenuItem(
        child: Text(item),
        value: item,
      ));
    });

    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.supervisor_account),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropDown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada= opt;
              });
            },
          ),
        ),
      ],
    );
  }
}