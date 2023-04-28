class User {
  int idUser;
  String name;
  String email;
  String password;
  String pictureUrl = "";

  User(this.idUser, this.name, this.email, this.password, this.pictureUrl);

  User.fromJson(Map<String, dynamic> json):
    idUser = json['id'],
    name = json['nome'],
    email = json['email'],
    password = json['senha'],
    pictureUrl = json['fotoURL'];

  Map<String, dynamic> toJson() => {
    'nome' : name,
    'email' : email,
    'senha': password,
    'fotoURL': pictureUrl
  };

}