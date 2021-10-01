class Carro {
  int id;
  String nome;
  String marca;
  String modelo;
  String ano;

  Carro(this.id, this.nome, this.marca, this.modelo, this.ano) {
    this.id = id;
    this.nome = nome;
    this.marca = marca;
    this.modelo = modelo;
    this.ano = ano;
  }

  Carro.fromJson(Map json)
    : id = json['id'],
      nome = json['nome'],
      marca = json['marca'],
      modelo = json['modelo'],
      ano = json['ano'];

}