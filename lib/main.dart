import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(new MaterialApp(
    title: "DATA SANTRI LOMBA FASI",
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

Future<List> ambilData() async{
    
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Santri Lomba FASI"),),
    );
  }
}