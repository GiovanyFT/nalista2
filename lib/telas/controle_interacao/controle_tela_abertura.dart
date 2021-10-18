
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nalista2/dominio/usuario.dart';
import 'package:nalista2/util/nav.dart';
import '../tela_login.dart';
import '../tela_principal.dart';

class ControleTelaAbertura{
  void inicializarAplicacao(BuildContext context) {
    // Dando um tempo para exibição da tela de abertura
    Future futureA = Future.delayed(Duration(seconds: 3));

    // Obtendo o Usuário (caso já esteja logado)
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        push(context, TelaLogin(), replace: true);
      } else {
        Usuario usuario;
/*        Firestore.instance.collection('usuarios').
        where("email", isEqualTo: "${user.email}").snapshots().
        listen((data) {
          usuario = Usuario.fromMap(data.documents[0].data);
          usuario.id = data.documents[0].documentID;
          push(context, TelaPrincipal(usuario), replace: true);

        });*/
      }
    });
 }
}
