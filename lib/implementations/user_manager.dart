import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:reservapp/models/user.dart';
import 'package:reservapp/services/user_service.dart';
import 'package:http/http.dart' as http;

class UserManager implements UserService {
  String baseUrl = '10.0.2.2';
  int port = 8000;
  String path = 'usuarios/';

  @override
  Future<User> userLogin(String email, String password) async {
    late User user;
    http.Response response;

    final url = Uri(
      scheme: 'http',
      host: baseUrl,
      port: 8000,
      path: path,
      queryParameters: {'q': email}
    );

    debugPrint(url.toString());

    try{
      response = await http.get(url);
    } catch(e){
      rethrow;
    }

    //TODO: Tratar o caso de email inexistente, que não chega no último else.
    if(response.statusCode == 200 && response.body.isNotEmpty){
      final jsonResponse = json.decode(response.body);
      user = User.fromJson(jsonResponse[0]);
      if(user.password == password){
        await SessionManager().set("user", user);
        User debugUser = User.fromJson(await SessionManager().get("user"));
        debugPrint(debugUser.name);
      } else{
        throw "Senha incorreta.";
      }
    } else{
      throw "O email inserido não possui conta cadastrada.";
    }

    return user;
  }

  @override
  Future<User> userRegister(String name, String email, String password) async {
    late User user;
    http.Response response;
    final url = Uri(
        scheme: 'http',
        host: baseUrl,
        port: port,
        path: path
    );

    try{
      response = await http.post(url, body: {"nome": name, "email": email, "senha": password, "fotoURL": "https://cdn-icons-png.flaticon.com/512/2815/2815428.png"});
    } catch(e){
      rethrow;
    }

    if(response.statusCode == 201){
      var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      user = User.fromJson(jsonResponse);
      // TODO: Usar esse SessionManager entre todos os aspectos do aplicativo.
      await SessionManager().set("id", user.idUser);
      await SessionManager().set("name", user.name);

    } else{
      switch(response.statusCode){
        case 400:
          throw 'Email já utilizado';
        case 500:
          throw 'Erro no servidor, tente novamente mais tarde';
        default:
          throw 'Erro de cadastro';
      }
    }

    return user;
  }
  
}