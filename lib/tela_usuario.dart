import 'package:flutter/material.dart';

void main() {
  runApp(const TelaUsuario());
}
class TelaUsuario extends StatelessWidget {
  // ignore: use_super_parameters
  const TelaUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela do Usuário'),
      ),
      body: const Center(
        child: Text('Esta é a tela do usuário'),
      ),
    );
  }
}
// esta tela sera modificada em breve