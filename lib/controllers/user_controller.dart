import 'dart:convert';
import 'package:reservapp/interfaces/user/i_user_controller.dart';
import 'package:http/http.dart' as http;
import '../interfaces/user/i_user_service.dart';

class UserController implements IUserController{
  late IUserService userService;
  late http.Response response;

  UserController(IUserService service){
    userService = service;
  }

  @override
  Future<Map<String, dynamic>> loginUser(String email, String password) async{
    dynamic jsonResponse;
    List jsonUser = [];

    try{
      response = await userService.getUserByEmail(email);
    } catch(e){
      jsonResponse = e.toString();
    }

    if(response.statusCode == 200){
      jsonUser = json.decode(latin1.decode(response.bodyBytes));
    } else{
      return _errorHandler(response);
    }

    if(jsonUser.isNotEmpty){
      jsonResponse = jsonUser[0];
    } else{
      return _errorHandler(http.Response("", 404));
    }

    if(jsonResponse['senha'] == password){
      return jsonResponse;
    } else{
      return _errorHandler(http.Response("Unauthorized", 401));
    }
  }

  @override
  Future<Map<String, dynamic>> registerUser(String name, String email, String password) async{
    dynamic jsonResponse;

    try{
      response = await userService.postUser(name, email, password);
    } catch(e){
      jsonResponse = e.toString();
    }

    if(response.statusCode == 201){
      jsonResponse = jsonDecode(latin1.decode(response.bodyBytes));
    } else{
      jsonResponse = _errorHandler(response);
    }

    return jsonResponse;
  }

  Map<String, dynamic> _errorHandler(http.Response response){
    switch(response.statusCode){
      case 400:
        return {'error': 'E-mail já está em uso'};
      case 401:
        return {'error': 'Usuário ou senha incorretos'};
      case 404:
        return {'error': 'Usuário não existe'};
      case 500:
        return {'error': 'Erro na conexão com o servidor'};
      default:
        return {'error': 'Erro ${response.statusCode}\n${response.body}'};
    }
  }
}