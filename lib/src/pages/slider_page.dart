import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlide = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Appp'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valorSlide,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : (valor) {
        setState(() {
          _valorSlide = valor;
        });
      },
    );
  }

  Widget _checkBox() {
    return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }
  
  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://pngimage.net/wp-content/uploads/2018/06/portgas-d-ace-png-3.png'),
      width: _valorSlide,
      fit: BoxFit.contain,
    );
  }
}