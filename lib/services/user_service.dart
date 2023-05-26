import "package:reservapp/models/user.dart";

abstract class UserService{
  Future<User> userRegister(String name, String email, String password);
  Future<User> userLogin(String email, String password);
}