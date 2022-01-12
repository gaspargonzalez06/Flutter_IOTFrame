import 'package:flutter/material.dart';
import "package:newpro/pages/home_page.dart";

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      theme: ThemeData(
        primarySwatch:Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity, 
      ),
      home: HomePage(),
    ) ;
  }
}

