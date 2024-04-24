import 'package:flutter/material.dart';
import 'package:geek_connect/tela_usuario.dart';

void main() {
  runApp(const TelaInicial());
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomTabbarExample(),
    );
  }
}

class BottomTabbarExample extends StatefulWidget {
  const BottomTabbarExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BottomTabbarExampleState();
}

class BottomTabbarExampleState extends State<BottomTabbarExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2, // Corrigido para 2, pois temos apenas duas abas
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Função que retorna o widget correspondente a cada aba
  Widget _buildTabPage(int index) {
    switch (index) {
      case 0:
        return Inicial();
      case 1:
        return Favoritos();
      default:
        throw 'Invalid index $index';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                // Navegar para a tela de usuário quando o ícone do usuário for clicado
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaUsuario()));
              },

              child: Icon(
                Icons.account_circle,
                size: 40,
              ), // Ícone do usuário
            ),
            SizedBox(width: 10), // Espaçamento entre o ícone e o texto
            Text("Geek Connect"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
            2,
            (index) => _buildTabPage(
                index)), // Corrigido para chamar _buildTabPage com o índice
      ),
      bottomNavigationBar: Material(
        color: Color.fromARGB(255, 96, 96, 96),
        child: TabBar(
          tabs: const [
            Tab(
              icon: Icon(
                Icons.home_rounded,
                size: 40,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.star_rounded,
                size: 40,
              ),
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

// Aba 1: Uma coluna 2x2 de imagens

class Inicial extends StatefulWidget {
  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  // Lista para armazenar o estado de favorito de cada imagem
  List<bool> isFavoritedList = List<bool>.filled(20, false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Chama a função para construir uma linha com duas imagens
          _buildRowWithImages(2, 1, 'assets/img1.jpg', 'Nome da imagem 1'),
          _buildRowWithImages(3, 4, 'assets/img2.jpg', 'Nome da imagem 2'),
          _buildRowWithImages(5, 6, 'assets/img3.jpg', 'Nome da imagem 3'),
          _buildRowWithImages(7, 8, 'assets/img4.jpg', 'Nome da imagem 4'),
          // Adicione mais linhas de imagens aqui se necessário
        ],
      ),
    );
  }

  // Função para construir uma linha com duas imagens
  Widget _buildRowWithImages(
      int index1, int index2, String imagePath, String imageName) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Chama a função para construir uma imagem com ícone de coração
          _buildImageWithHeartIcon(imagePath, imageName, index1),
          SizedBox(width: 10.0),
          _buildImageWithHeartIcon(imagePath, imageName, index2),
        ],
      ),
    );
  }

  // Função para construir uma imagem com ícone de coração
  Widget _buildImageWithHeartIcon(
      String imagePath, String imageName, int imageIndex) {
    return Expanded(
      child: Column(
        children: [
          Stack(
            children: [
              // Imagem
              Image.asset(
                imagePath,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              // Ícone de coração
              Positioned(
                top: 5.0,
                left: 5.0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // Alterna o estado de favorito ao clicar no ícone de coração
                      isFavoritedList[imageIndex] =
                          !isFavoritedList[imageIndex];
                    });
                    // Mostra uma mensagem de snackbar quando adiciona aos favoritos
                    _showSnackBar(
                        context, 'Evento foi adicionado aos favoritos');
                  },
                  child: Icon(
                    Icons.favorite,
                    color: isFavoritedList[imageIndex]
                        ? Colors.purple
                        : Colors.grey,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          // Nome da imagem
          Text(
            imageName,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  // Função para mostrar uma snackbar
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

// Aba 2: Tela de detalhes
class Favoritos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favoritos'), // Conteúdo da aba 2
    );
  }
}
