import 'package:reservapp/services/user_service.dart';
import 'package:reservapp/models/user.dart';

class UserController{
  late UserService userService;

  UserController(UserService service){
    userService = service;
  }

  Future<User> registerUser(String name, String email, String password) async {
    User user = await userService.userRegister(name, email, password);

    return user;
  }

  Future<User> loginUser(String email, String password) async {
    User user = await userService.userLogin(email, password);

    return user;
  }
}