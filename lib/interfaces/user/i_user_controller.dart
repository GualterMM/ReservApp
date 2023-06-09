abstract class IUserController {
  Future<Map<String, dynamic>> registerUser(String name, String email, String password);
  Future<Map<String, dynamic>> loginUser(String email, String password);
}