import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myflutterapp/procesos/autenticacion.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState()=> _loginState();
}

//CREACION DE CONTROLADORES PARA LOS TEXTFIELD QUE REQUERIMOS
final email= TextEditingController();
final password= TextEditingController();

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(
      title: Text("Login / Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Email", suffixIcon: Icon(Icons.email)
              ),
            ),
            TextField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                hintText: "Password", suffixIcon: Icon(Icons.key)
              ),
            ),
                Divider(),
                //EL DIVIDER LO USO PARA QUE LOS INPUTS NO ESTEN MUY PEGADOS
                ElevatedButton.icon(
                  onPressed: (){
                    Autenticacion().IniciarSesion(email: email.text, password: password.text);
            }, 
              icon: Icon(Icons.login),
              label: Text("Iniciar Sección")),
                Divider(),
                ElevatedButton.icon(
                  onPressed: (){
                     Autenticacion().CrearUsuario(email: email.text, password: password.text);
            }, 
              icon: Icon(Icons.person_add_alt),
              label: Text("Registrarse"))
          ],
        ),
      ),
      );
  }
}