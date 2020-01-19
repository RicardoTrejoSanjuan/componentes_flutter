import 'package:flutter/material.dart';

import 'package:componentes_flutter/src/pages/alert_page.dart';
import 'package:componentes_flutter/src/pages/avatar_page.dart';
import 'package:componentes_flutter/src/pages/home_page.dart';
import 'package:componentes_flutter/src/pages/card_page.dart';
import 'package:componentes_flutter/src/pages/animated_container.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    '/'        : (BuildContext context) => HomePages(),
    'avatar'   : (BuildContext context) => AvatarPage(),
    'alert'    : (BuildContext context) => AlertPage(),
    'cards'    : (BuildContext context) => CardPage(),
    'animation': (BuildContext context) => AnimatedContainerPage(),
  };
}
