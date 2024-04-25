// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geek_connect/tela_cadastro.dart';
import 'package:geek_connect/tela_inicial.dart';

void main() {
  runApp(const MainLogin());
}

class MainLogin extends StatelessWidget {
  const MainLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                Icon(
                  Icons.account_circle,
                  size: 120,
                ),
                SizedBox(height: 50),
                Text(
                  'BEM VINDO',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'DE VOLTA',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 350,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Color.fromARGB(255, 12, 39, 69),
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      fillColor: Color.fromARGB(255, 96, 96, 96),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 94, 97, 94)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    obscureText: false,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 350,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      filled: true,
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      fillColor: Color.fromARGB(255, 96, 96, 96),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 96, 96, 96)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20),
                Builder(
                  builder: (context) => TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TelaCadastro(),
                        ),
                      );
                    },
                    child: Text(
                      'Não tem uma conta? Registre-se!',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // começo do botao de login
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 184, 184, 184),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Builder(
                    builder: (context) => TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaInicial(),
                          ),
                        );
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
