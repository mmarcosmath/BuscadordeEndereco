
import 'package:buscarcep/app/screen/buscacep.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BuscarCep(),
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
      ),
    );
  }
}
