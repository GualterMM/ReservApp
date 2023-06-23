class MenuItem{
  int idItem;
  String name;
  double price;
  String itemType;
  String description = "";

  MenuItem(this.idItem, this.name, this.price, this.itemType, this.description);

  MenuItem.fromJson(Map<String, dynamic> json):
      idItem = json['id'],
      name = json['nome'],
      price = json['preco'],
      itemType = json['tipoItem'],
      description = json['descricao'];

  Map<String, dynamic> toJson() => {
    'nome' : name,
    'preco' : price,
    'tipoItem' : itemType,
    'descricao': description,
  };
}