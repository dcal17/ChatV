import 'package:firebase_auth/firebase_auth.dart';

class Autenticacion {
  final FirebaseAuth fire=FirebaseAuth.instance;
  User? get usuarios => fire.currentUser;
  //esta variable me va a permitir ver el estado de los usuarios
  Stream<User?> get estadoLogin=> fire.authStateChanges();

  //FUNCION ASINCRONICA PARA INICIAR SESSION
  //METODO INICIAR SESSION
  Future<void> IniciarSesion({required String email, required String password})async{
    try {
      await fire.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
    
  }
  //CREACION DE USUARIOS
  //METODO CREACION DE USUARIOS
  Future<void> CrearUsuario({required String email, required String password})async{
    try {
      await fire.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  //CERRAR SESION
  //METODO CERRAR SESION
  Future<void> CerrarSesion()async{
    try {
      await fire.signOut();
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}