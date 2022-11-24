import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/interfaz/home.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBUJaYlUgYKln82L4XybIjTcTD7s2pJcAg",
      authDomain: "reto3-chat-8f720.firebaseapp.com",
      projectId: "reto3-chat-8f720",
      storageBucket: "reto3-chat-8f720.appspot.com",
      messagingSenderId: "1082403556990",
      appId: "1:1082403556990:web:86236fd624a6f2e86b922f",
      measurementId: "G-QBD1Y95JR7"));
  runApp(const MyApp());
}