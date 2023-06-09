import "package:http/http.dart" as http;

abstract class IUserService{
  Future<http.Response> postUser(String name, String email, String password);
  Future<http.Response> getUserByEmail(String email);
}