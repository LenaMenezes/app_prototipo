// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

void telacadastro() {
  runApp(const TelaCadastro());
}

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // centraliza meus elementos
              children: <Widget>[
                SizedBox(height: 50), // espaçamento 
                Icon(
                  Icons.account_circle, // icon de user 
                  size: 120,
                ),
                SizedBox(height: 10),
                Text(
                  'BEM VINDO',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container( // container que armazena meus input
                  width: 350,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Nome',
                      filled: true,
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      fillColor: Color.fromARGB(255, 96, 96, 96),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 96, 96, 96)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    obscureText: false, // deixa o texto que sera escrito no input visivel
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 350,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      filled: true,
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      fillColor: Color.fromARGB(255, 96, 96, 96),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 96, 96, 96)),
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
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 96, 96, 96)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                        context); // pop faz com que ele retorne para tela anterior
                  },
                  child: Text(
                    'Já tem conta? Realize o login!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 184, 184, 184),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // logica para o botao, sera implementado em breve
                    },
                    child: Text(
                      'CADASTRE-SE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
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
