class Contato {
  String nome;
  String email;
  bool favorito;

  Contato({
    required this.nome,
    required this.email,
    this.favorito = false,
  });

}
