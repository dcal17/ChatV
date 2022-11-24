import 'package:flutter/material.dart';
import 'package:myflutterapp/interfaz/chat.dart';
import 'package:myflutterapp/interfaz/login.dart';
import 'package:myflutterapp/procesos/autenticacion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Autenticacion().estadoLogin,
      builder: (context, respuesta) {
        if (respuesta.hasData) {
          return chat();
        } else {
          return login();
        } 
      });
  }
}