import 'package:flutter/material.dart';
import 'package:nalista2/telas/tela_abertura.dart';

// Para chamar Firebase.initializeApp()
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        // Define o tema para claro ou escuro
        brightness: Brightness.light,
        // Define a cor de fundo padrão para Containers
        scaffoldBackgroundColor: Colors.white,
      ),
      home: TelaAbertura(),
    );
  }
}
