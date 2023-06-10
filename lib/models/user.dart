class User {
  int idUser;
  String name;
  String email;
  String pictureUrl;

  User(this.idUser, this.name, this.email, this.pictureUrl);

  User.fromJson(Map<dynamic, dynamic> json):
    idUser = json['id'],
    name = json['nome'],
    email = json['email'],
    pictureUrl = json['fotoURL'];

  Map<dynamic, dynamic> toJson() => {
    'id' : idUser,
    'nome' : name,
    'email' : email,
    'fotoURL': pictureUrl
  };

}