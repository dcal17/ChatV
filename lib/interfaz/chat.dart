import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/interfaz/mensajes.dart';
import 'package:myflutterapp/procesos/autenticacion.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState()=> _chatState();
}

//VARIABLE QUE ME PERMITE CONECTARME CON MI DB PARA USAR LOS SERVICIOS
final mensaje= TextEditingController();
final fire= FirebaseFirestore.instance;

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [IconButton(onPressed: (){
          Autenticacion().CerrarSesion();
        }, icon: Icon(Icons.logout)),VerticalDivider(),Text((Autenticacion().usuarios?.email).toString())],),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child:TextField(
                    controller: mensaje,
                    decoration: InputDecoration(hintText: "Escriba su mensaje..."),
              ), 
            ),   
            IconButton(onPressed: (){
              //ESTA PREGUNTA LA HAGO PARA QUE CUANDO EL MENSAJE ESTE VACIO NO LO GUARDE EN LA DB
              if(mensaje.text.isNotEmpty){
              //AQUI CREO LA COLECCIÓN PARA LA BD Y CON EL DOC ENVIO EL JSON QUE ME PIDEN
              fire.collection("Chat").doc().set({
                "mensaje":mensaje.text,
                //EL .NOW LO UTILIZO PARA QUE GUARDE LA FECHA Y HORA EN TIEMPO REAL DEL MENSAJE
                "tiempo":DateTime.now(),
                //AQUI UTILIXO EN EMAIL PARA VERIFICAR QUE SI ESTOY AUTENTICADO
                "email":(Autenticacion().usuarios?.email).toString()
              });
              //AQUI CON .CLEAR LIMPIO MI CASILLA DE MENSAJES DESPUES DE ENVIAR UN MENSAJE
              mensaje.clear();
              }
            }, icon: Icon(Icons.send))],
            ),
            Container(
              child: Expanded(child: mensajes()),
            )
          ],
        ),
      ),
    );
  }
}