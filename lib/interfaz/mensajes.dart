import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/procesos/autenticacion.dart';

class mensajes extends StatefulWidget {
  const mensajes({super.key});

  @override
  State<mensajes> createState()=> _mensajesState();
}

class _mensajesState extends State<mensajes>{
  //CONSULTA A NUESTRA DB PARA LISTAR NUESTROS MENSAJES
  Stream<QuerySnapshot> respuesta_consulta=FirebaseFirestore.instance.collection("Chat").orderBy("tiempo", descending: true).snapshots();



  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      stream: respuesta_consulta,
      builder: (context,AsyncSnapshot<QuerySnapshot> respuesta){
        return ListView.builder(
          itemCount: respuesta.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(  //CON CARD DIFERENCIO LOS MENSAJES YA LISTADOS, LO HAGO PARA QUE SE VEA MAS ESTILIZADO
            //AQUI LE PONGO COLORES A LOS CHATS PARA DIFERENCIAR CUALES ENVIE YO Y CUALES ENVIO OTRO USUARIO
              color: (Autenticacion().usuarios?.email).toString()==respuesta.data!.docs[index].get("email")? Colors.green[50]:Colors.amber[50],
              child: ListTile(
                //CON ESTA LINEA ACOMODO EL TITULO Y SUBTITULO Y PREGUNTO SI EL EMAIL DE LA DV ES IGUAL AL QUE ESTA ENVIANDO EL MSJ PONMELO A LAS IZQUIERDA, SINO A LA DERECHA
                title: Text(respuesta.data!.docs[index].get("mensaje"), textAlign: (Autenticacion().usuarios?.email).toString()==respuesta.data!.docs[index].get("email")? TextAlign.left:TextAlign.left,),
                subtitle: Text(respuesta.data!.docs[index].get("email"), textAlign: (Autenticacion().usuarios?.email).toString()==respuesta.data!.docs[index].get("email")? TextAlign.left:TextAlign.left,),
              ),
            );
          } );
      });
  }
}