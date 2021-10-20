import 'package:flutter/material.dart';


import 'package:disenos_app/src/pages/slider_list.dart';
//import 'package:disenos_app/src/pages/emergency_page.dart';
//import 'package:disenos_app/src/widgets/slideshow.dart';
//import 'package:disenos_app/src/pages/pinterest_page.dart';

//import 'package:disenos_app/src/labs/circular_progress_page.dart';
//import 'package:disenos_app/src/pages/animaciones_page.dart';
//import 'package:disenos_app/src/pages/headers_page.dart';
//import 'package:disenos_app/src/pages/rets/cuadrado_animado_page.dart';
//import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
//import 'package:disenos_app/src/pages/slideshow_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: SliverListPage(),
    );
  }
}
