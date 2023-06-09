import 'package:reservapp/interfaces/user/i_user_service.dart';
import 'package:reservapp/routes/router.dart';
import 'package:reservapp/assets/constants/consts.dart' as constants;
import "package:http/http.dart" as http;

class UserService implements IUserService {
  var client = http.Client();
  late http.Response response;

  @override
  Future<http.Response> postUser(
      String name, String email, String password) async {
    try {
      response =
          await client.post(userRegisterRoute(constants.LOCAL_HOST), body: {
        "nome": name,
        "email": email,
        "senha": password,
        "fotoURL": constants.DEFAULT_PICTURE,
      });
    } catch (e) {
      rethrow;
    }

    return response;
  }

  @override
  Future<http.Response> getUserByEmail(String email) async {
    try {
      response =
          await client.get(userLoginRoute(constants.LOCAL_HOST, {'q': email}));
    } catch (e) {
      rethrow;
    }

    return response;
  }
}
