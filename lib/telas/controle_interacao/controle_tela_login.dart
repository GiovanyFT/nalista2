
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nalista2/dominio/usuario.dart';
import 'package:nalista2/util/nav.dart';
import 'package:nalista2/util/toast.dart';

import '../tela_principal.dart';


class ControleTelaLogin {
  // Controles de edição do login e senha
  final controlador_login = TextEditingController();
  final controlador_senha = TextEditingController();

  // Controlador de formulário (para fazer validações)
  final formkey = GlobalKey<FormState>();

  // Controladores de foco
  final focus_senha = FocusNode();
  final focus_botao = FocusNode();

  // Autenticação
  final FirebaseAuth _auth = FirebaseAuth.instance;

 // CollectionReference get _collection_usuarios => Firestore.instance.collection('usuarios');

  void logar(BuildContext context) async{
    if (formkey.currentState!.validate()){
      String login = controlador_login.text.trim();
      String senha = controlador_senha.text.trim();

      try {
        // Logando
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: login,
            password: senha
        );
        _irParaTelaPrincipal(userCredential.user, context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          MensagemAlerta("Erro: Usuário não encontrado para o email informado");
        } else if (e.code == 'wrong-password') {
          MensagemAlerta("Erro: Password inválido!!!");
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  void _irParaTelaPrincipal(User? user, BuildContext context) {
    // Buscando o usuário no serviço de armazenamento e chamando a tela Principal
 /*   _collection_usuarios.
      where("email", isEqualTo: "${user!.email}").snapshots().
      listen((data) {
        Usuario usuario = Usuario.fromMap(data.documents[0].data);
        usuario.id = data.documents[0].documentID;
        push(context, TelaPrincipal(usuario), replace: true);
      });
      */

  }

  void cadastrar(BuildContext context) async{
    if (formkey.currentState!.validate()){
      String login = controlador_login.text.trim();
      String senha = controlador_senha.text.trim();

      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: login,
            password: senha
        );
        // No serviço de armazenamento
  /*      DocumentReference docRef = _collection_usuarios.document();
        Future<void> future = docRef.setData({'email': userCredential.user!.email});
        future.then( (value){
          _irParaTelaPrincipal(userCredential.user, context);
        });
*/

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          MensagemAlerta("Erro: A senha fornecida é muito fraca");
        } else if (e.code == 'email-already-in-use') {
          MensagemAlerta("Erro: Já existe conta com o email informado");
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
