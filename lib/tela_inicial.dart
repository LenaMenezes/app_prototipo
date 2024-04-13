// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void telainicial() {
  runApp(const TelaInicial());
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color.fromARGB(255, 184, 184, 184), toolbarHeight: 80,
        leading: Icon(Icons.menu),
        title: Text('Geek Connect'),
        actions: [
        Icon(Icons.favorite),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.search),
        ),
        Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.purple,
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 184, 184, 184),
        fixedColor: Color.fromARGB(255, 0, 0, 0),

        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home", 
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favoritos", 
          ),
        ],
      ),
    );
  }
}
