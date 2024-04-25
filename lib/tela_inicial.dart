// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geek_connect/tela_usuario.dart';

void main() {
  runApp(const TelaInicial());
}

class TelaInicial extends StatelessWidget { // definicao da classe Tela inicial 'padrao' e logo a baixo o construtor d class
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      home: Bottombar(),// definiçao do bottombar    
    );
  }
}

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BottomTabbarExampleState(); // Sobrescreve o método retornar uma instância do estado BottomTabbarExampleState
}

class BottomTabbarExampleState extends State<Bottombar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;  // controlador das abas da barra de navegação

  @override
  void initState() {
    super.initState();
    _tabController = TabController( // Inicializa o TabController para gerenciar as abas, no caso to usando duas abas: a inicial e a favorita
      length: 2,
      vsync: this, //isso foi uma sugestao do vscode que sincroniza as animações da barra de navegação;
    );
  }

  @override
  void dispose() {
    _tabController.dispose(); // recursos do TabController 
    super.dispose(); 
  }


  Widget _buildTabPage(int index) { //metodo para contruir o widget da pag usando o index das pags 
    switch (index) {
      case 0:
        return Inicial(); //retorna a pag inicial
      case 1:
        return Favoritos(); //retorna a pag favoritos, seguindo nessa logica, poderia adicionar mais pags na minha nav, mas no meu caso nao é necessario
      default:
        throw 'Invalid index $index'; // aq ele me mostra se meu indice esta correto, facilitou bastante na hora de montar a estrutura de imgs tbm
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // é basicamente o layout de tela básico do Material Design
      appBar: AppBar( // barra do app 
        title: Row( 
          children: [ // Lista de widgets filhos da linha
            GestureDetector(
              onTap: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaUsuario()));
              },

              child: Icon(
                Icons.account_circle,
                size: 40,
              ),
            ),
            SizedBox(width: 10),
            Text("Geek Connect"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
            2, (index) => _buildTabPage(index)),
      ),
      bottomNavigationBar: Material(
        color: Color.fromARGB(255, 255, 255, 255),
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

class Event {
  final String imagePath;
  final String eventName;
  final String eventoData;
  final String eventoDescri;
  final String eventoLocal;
  final String siteUrl;

  Event(this.imagePath, this.eventName, this.eventoData, this.eventoDescri,
      this.eventoLocal, this.siteUrl);
}

class EventDetails extends StatelessWidget {
  final Event event;

  EventDetails(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes de ${this.event.eventName}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              event.imagePath,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.eventName,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.calendar_today_rounded, size: 20,),
                      SizedBox(width: 5),
                      Text(
                        event.eventoData,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    event.eventoDescri,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20),
                  Text(
                    event.eventoLocal,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: TextButton(
                      onPressed: () {
                        _launchURL();
                      },
                      child: Text(
                        'Garanta seu ingresso',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    width: double.infinity,
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL() async {
    // ignore: deprecated_member_use
    if (await canLaunch(event.siteUrl)) {
      // ignore: deprecated_member_use
      await launch(event.siteUrl);
    } else {
      throw 'Could not launch ${event.siteUrl}';
    }
  }
}

class Inicial extends StatefulWidget {
  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  List<Event> events = [
    Event(
      'assets/evento1.png',
      'Anime Station - Terceira Edição',
      '17 ago - 2024 • 09:00 > 17 ago - 2024 • 21:00',
      'Venha se juntar a nós na terceira edição do Anime Station! O local está em processo de definição, mas garantiremos que seja de fácil acesso para todos. Prepare-se para um dia repleto de diversão, com concursos de cosplay e kpop, bate-papo com cosplayers, sessões de karaoke, shows ao vivo, salas temáticas e muito mais. Não perca a oportunidade de se divertir conosco neste evento imperdível!',
      'Local: Local a definir São Paulo, SP',
      'https://www.sympla.com.br/evento/anime-station-terceira-edicao/2400550?referrer=www.google.com',
    ),
    Event(
      'assets/evento2.png',
      'OSASCO GAME FEST 2024',
      '27 abr - 2024 • 10:30 > 28 abr - 2024 • 20:30',
      'Evento GAMES destinado ao publico em geral que curte o universo nerd, pop & Geek (que engloba atrações de anime, mangá, cartoon, saraus. cosplay, K-pop, desenhos animados, cinema, literatura, música, HQs, Slam, Perifa Geek, Workshops, bate papo, Rpg, Bandas, Dublador e videogames), o evento contará com diversas atrações, além de diversas oficinas de artes. Teremos salas temáticas, expositores, desfiles de cosplayers , concurso k-pop, sorteios, espaço dos artistas, apresentações, gincanas e muito mais. O EVENTO TEM ENTRADA GRATUITA!',
      'Local: Escola de Artes César Antonio Salvi Rua Tenente Avelar Píres de Azevedo, 360 Centro Osasco, SP',
      'https://www.sympla.com.br/evento/osasco-game-fest-2024/2429231?referrer=www.google.com',
    ),
    Event(
      'assets/evento3.png', 
      'Caravana ANIME FRIENDS 2024 / Animageek', 
      '21 jul - 2024 • 07:30 > 21 jul - 2024 • 21:00', 
      'Adquira seu lugar na caravana oficial para o Anime Friends 2024, organizado pela AnimaGeek. Esta oferta é válida para residentes das cidades de Itu, Indaiatuba, Porto Feliz e Sorocaba. O valor pago inclui o ingresso para o evento e o assento na caravana. Após efetuar o pagamento, envie o comprovante juntamente com a cidade desejada através do WhatsApp para Ricardo Machado, coordenador de caravanas, no número 15 9 9185 4362.', 
      'Local: Centro de Convenções - Distrito Anhembi Avenida Olavo Fontoura, 1209 Santana São Paulo, SP',
      'https://www.sympla.com.br/evento/caravana-anime-friends-2024-animageek/2339213?referrer=www.google.com'
      ),
    Event(
      'assets/evento4.png',
      'Anime Song Fest', 
      '11 mai - 2024 • 13:00 > 11 mai - 2024 • 17:00', 
      'Prepare-se para uma explosão de energia e emoção no Anime Song Fest, onde a magia dos animes ganha vida através da música! Com o show das bandas The Fist Bump, Kansei e Kaori, você será transportado para universos épicos e emocionantes de seus animes favoritos. A programação inclui apresentações ao vivo das três bandas, um concurso para eleger o melhor cosplay do festival, sorteios e premiações durante as apresentações. Você terá a chance de viver o sonho de seu personagem favorito, indo de cosplay e se juntando a nós nesse festival! Pedimos que os cosplayers evitem trajes muito volumosos para que todos possam aproveitar a vista e o festival sem obstáculos. É proibido o uso de Purpurina/Glitter, então por favor, deixe-os em casa. Além disso, o festival oferece uma seleção de bebidas deliciosas e hambúrgueres para acompanhar sua jornada musical. Lembre-se de que bebidas e alimentos não estão inclusos no valor do ingresso.', 
      'Local: Red Star Studios - Unidade Pinheiros 2 Rua Teodoro Sampaio, 512, Estúdio RedStar, Pinheiros São Paulo, SP',
      'https://www.sympla.com.br/evento/anime-song-fest/2413584?referrer=www.google.com'
      ),
    Event(
      'assets/evento5.png', 
      'Anime Geek Darkness 2', '13 out - 2024 • 12:00 > 13 out - 2024 • 20:30', 
      'Anime Geek Darknees é um evento anual promovido pela PaladinoStudios, que acontece em outubro em celebração ao Halloween. O evento destaca uma variedade de cosplays inspirados no universo do terror, oferecendo uma atmosfera única e envolvente. Originário do Campinas Anime Geek, agora ele expande seu alcance para Piracicaba, São Paulo, proporcionando aos fãs uma experiência ainda mais emocionante e assustadora. Prepare-se para mergulhar em um mundo de fantasia sombria e diversão sinistra!', 
      'Local: Av. Dr. Cássio Pascoal Padovani, 3199 Avenida Doutor Cássio Pascoal Padovani, 3199 Parque Santa Cecilia Piracicaba, SP', 
      'https://www.sympla.com.br/evento/anime-geek-darkness-2/2329017?referrer=www.google.com'
      ),
    Event(
      'assets/evento6.png', 
      'COSMO ANIME GEEK 6', 
      '09 jun - 2024 • 11:00 > 09 jun - 2024 • 18:00', 
      'Prepare-se para a terceira edição do Circuito Anime Geek, onde o Cosmo Anime Geek promete agitar a galera e fazer história. Com a presença de dois dubladores e a Banda Elísios garantindo a animação, o evento oferece diversas atrações para todos os fãs. Desde karaokê até competição de Kpop, passando por desfile e atuação cosplay, todos têm a chance de mostrar seus talentos e concorrer a prêmios incríveis. Os formulários de inscrição já estão disponíveis desde 22 de março. Não perca a oportunidade de participar deste evento imperdível, marcado para o dia 9 de junho, na Igreja Nossa Senhora Aparecida, em Cosmópolis-SP. A entrada é franca, mas pede-se a doação de 1kg de alimento não perecível.', 
      'Local: Cosmo Anime Geek Rua São Paulo, SN, AO LADO DA FEIRA MUNICIPAL DE DOMINGO, Jardim dos Scursonis Cosmópolis, SP',
      'https://www.sympla.com.br/evento/cosmo-anime-geek-6/2394077?referrer=www.google.com'
      ),
    Event(
      'assets/evento7.png', 
      'Motor Geek Fest', 
      '13 jul - 2024 • 11:00 > 14 jul - 2024 • 19:00', 
      'Olá pessoal! Está chegando a hora de Cordeirópolis ter o seu tão esperado evento GEEK! Com a entrada sendo apenas 1 kg de alimento não perecível, a Prefeitura de Cordeirópolis em parceria com a PaladinoStudios estão preparando o Motor Geek Fest, dois dias repletos de diversão e entretenimento. Traga seu Cosplay e aproveite ao máximo o evento, que acontecerá ao lado do grandioso Motor Rock Fest, proporcionando uma experiência única com muito rock "n" roll e motos imponentes de estrada. Com competições e atrações especiais, marque na sua agenda: 13 e 14 de Julho, das 11:00 às 19:00 horas. E atenção, neste ano de 2024, o evento fará parte do Circuito Anime Geek, sendo o quarto da linha de cinco eventos, valendo pontos para a premiação final em Dezembro.', 
      'Local: Salão Social Maria De Lourdes Arrais Rua Carlos Gomes, 78, Junto ao evento Motor Fest, Centro Cordeirópolis, SP',
      'https://www.sympla.com.br/evento/motor-geek-fest/2394163?referrer=www.google.com'
      ),
    Event(
      'assets/evento8.png',
      'FEIRA GEEK NA AVENIDA PAULISTA', 
      '13 abr - 2024 • 10:00 > 14 abr - 2024 • 20:00', 
      'A primeira edição da Feira Geek na Avenida Paulista promete ser um encontro vibrante para fãs de todas as idades da cultura pop e geek. Hospedada no Club Homs, próximo ao metrô Brigadeiro, nos dias 13 e 14 de abril de 2024, o evento oferece uma ampla gama de atividades. Desde apresentações de bandas de K-pop até bate-papos com especialistas, concursos de cosplay, palestras sobre o universo geek e uma variedade de jogos e games. Destaque para o Painel JBC: Jiraiya, com a participação do roteirista Chris Tex e do desenhista Santtos, discutindo a produção do quadrinho original do Jiraiya, a ser lançado em 204 pela Editora JBC. No sábado, os visitantes poderão participar de um emocionante duelo de sabres de luz às 17h35, com batalhas que remetem a uma galáxia muito, muito distante. Em ambos os dias, às 18h, acontece o concorrido concurso cosplay, com prêmios em jogo. E para os entusiastas de arte e quadrinhos, haverá uma área especial de Artists Alley, onde artistas talentosos exibirão suas obras e habilidades. Prepare-se para mergulhar em um fim de semana repleto de entretenimento e diversão geek na movimentada Avenida Paulista.', 
      'Local: Club Homs Av. Paulista, 735, próximo ao metrô Brigadeiro. São Paulo-SP',
      'https://madeinjapan.com.br/agenda/evento/feira-geek-na-avenida-paulista/'
      ),
    // Adicione mais eventos aqui se necessário
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < events.length; i++)
            _buildRowWithImages(i, events[i]),
        ],
      ),
    );
  }

  Widget _buildRowWithImages(int index, Event event) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventDetails(event)),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  event.imagePath,
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Text(
              event.eventName,
              style: TextStyle(fontSize: 16.0),
            ),
          ],),
      ),
    );
  }
}


class Favoritos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favoritos'),
    );
  }
}
