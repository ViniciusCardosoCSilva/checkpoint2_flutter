import 'package:flutter/material.dart';

import 'contatos.dart';

List<Contato> contatos = [
  Contato(nome: 'Vinícius', email: 'vinicius@gmail.com'),
  Contato(nome: 'Gabriel', email: 'gabriel@gmail.com'),
  Contato(nome: 'William', email: 'william@gmail.com'),
  Contato(nome: 'Jhamil', email: 'jhamil@gmail.com'),
  Contato(nome: 'Hugo', email: 'hugo@gmail.com'),
  Contato(nome: 'Enzo', email: 'enzo@gmail.com'),
  Contato(nome: 'Vitor', email: 'vitor@gmail.com'),
  Contato(nome: 'Ricardo', email: 'ricardo@gmail.com')

];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Contatos',
      home: ListaContatos(),
    );
  }
}

class ListaContatos extends StatefulWidget {
  @override
  _ListaContatosState createState() => _ListaContatosState();
}

int calcularTotalFavoritos(List<Contato> contatos) {
  return contatos.where((contato) => contato.favorito).length;
}

class _ListaContatosState extends State<ListaContatos> {
  List<Contato> contato = [
    Contato(nome: 'Vinícius', email: 'vinicius@gmail.com'),
    Contato(nome: 'Vitor', email: 'vitor@gmail.com'),
    Contato(nome: 'Gabriel', email: 'gabriel@gmail.com'),
    Contato(nome: 'William', email: 'william@gmail.com'),
    Contato(nome: 'Jhamil', email: 'jhamil@gmail.com'),
    Contato(nome: 'Hugo', email: 'hugo@gmail.com'),
    Contato(nome: 'Enzo', email: 'enzo@gmail.com'),
    Contato(nome: 'Ricardo', email: 'ricardo@gmail.com')
  
  ];

  int totalFavoritos = 0;

  @override
  void initState() {
    super.initState();
    totalFavoritos = calcularTotalFavoritos(contatos);
  }
 
  void atualizarTotalFavoritos() {
    setState(() {
      totalFavoritos = calcularTotalFavoritos(contatos);
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Text('Lista de Contatos'),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.favorite, color: Colors.white),
                  SizedBox(width: 4),
                  Text(
                    totalFavoritos.toString(),
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: contato.length,
        itemBuilder: (context, index) {
          Contato contato = contatos[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=$index'),
            ),
            title: Text(contato.nome),
            subtitle: Text(contato.email),
            trailing: IconButton(
              icon: contato.favorito ? Icon(Icons.favorite) : Icon(Icons.favorite_border), color: Colors.red,
              onPressed: () {
                setState(() {
                  contato.favorito = !contato.favorito;
                  atualizarTotalFavoritos();
                });
              },
              ),
          );
        },
      ),
    );
  }
}

