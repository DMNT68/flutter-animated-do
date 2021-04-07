import 'package:flutter/material.dart';

import 'package:animated_do/src/pages/pagina1_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated_do',
      home: Pagina1Page()
    );
  }
}