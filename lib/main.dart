import 'package:flutter/material.dart';
import 'package:componentes_flutter/src/pages/alert_page.dart';
import 'package:componentes_flutter/src/pages/avatar_page.dart';
import 'package:componentes_flutter/src/pages/home_page.dart';
// import 'package:componentes_flutter/src/pages/home_temp.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      // home: HomePages()
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/'     : (BuildContext context) => HomePages(),
        'avatar' : (BuildContext context) => AvatarPage(),
        'alert' : (BuildContext context) => AlertPage(),
      },
    );
  }
}