import 'package:mockito/mockito.dart';
import 'package:reservapp/controllers/user_controller.dart';
import 'package:reservapp/services/user_service.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'user_controller_test.mocks.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([UserService])
void main() {
  group("UserController tests for login", () {
    late MockUserService mockService;
    late UserController userController;
    late String email;
    late String password;

    setUp(() {
      mockService = MockUserService();
      userController = UserController(mockService);
      email = "user@email.com";
      password = "Password#123";
    });

    test("Should return a valid JSON given the email and password of a registered user", () async {
      when(mockService.getUserByEmail(email)).thenAnswer((_) async => http.Response(
          '[{"id" : 1, "nome": "User", "email": "user@email.com", "senha": "Password#123", "fotoURL": "picture.com"}]',
          200));

      Map<String, dynamic> json =
          await userController.loginUser(email, password);

      expect(json, isA<Map<String, dynamic>>());
    });

    test("Should perform a login operation given the email and password of a registered user", () async {
      when(mockService.getUserByEmail(email)).thenAnswer((_) async => http.Response(
          '[{"id" : 1, "nome": "User", "email": "user@email.com", "senha": "Password#123", "fotoURL": "picture.com"}]',
          200));

      Map<String, dynamic> json =
          await userController.loginUser(email, password);

      expect(json['email'], email);
      expect(json['senha'], password);
    });

    test("Should return a custom error message when either the password or email are incorrect (HTTP 401 Unauthorized)", () async {
      when(mockService.getUserByEmail(email)).thenAnswer((_) async => http.Response('Unauthorized', 401));

      Map<String, dynamic> json =
          await userController.loginUser(email, password);

      expect(json['error'], 'Usuário ou senha incorretos');
    });

    test("Should return a custom error message when user credentials don't exist in the database (HTTP 404 Not Found)", () async {
      when(mockService.getUserByEmail(email)).thenAnswer((_) async => http.Response('Not Found', 404));

      Map<String, dynamic> json =
          await userController.loginUser(email, password);

      expect(json['error'], 'Usuário não existe');
    });

    test("Should return a custom error message when a internal server error occurs (HTTP 500 Internal Server Error)", () async {
      when(mockService.getUserByEmail(email)).thenAnswer((_) async => http.Response('Internal Server Error', 500));

      Map<String, dynamic> json =
          await userController.loginUser(email, password);

      expect(json['error'], 'Erro na conexão com o servidor');
    });
  });

  group("UserController tests for registering", () {
    late MockUserService mockService;
    late UserController userController;
    late String name;
    late String email;
    late String password;

    setUp(() {
      mockService = MockUserService();
      userController = UserController(mockService);
      name = "User";
      email = "user@email.com";
      password = "Password#123";
    });

    test("Should return a valid JSON given a valid name, email and password", () async {
      when(mockService.postUser(name, email, password)).thenAnswer((_) async => http.Response(
          '{"id" : 1, "nome": "User", "email": "user@email.com", "senha": "Password#123", "fotoURL": "picture.com"}',
          201));

      Map<String, dynamic> json =
      await userController.registerUser(name, email, password);

      expect(json, isA<Map<String, dynamic>>());
    });

    test("Should return valid user credentials after registering", () async {
      when(mockService.postUser(name, email, password)).thenAnswer((_) async => http.Response(
          '{"id" : 1, "nome": "User", "email": "user@email.com", "senha": "Password#123", "fotoURL": "picture.com"}',
          201));

      Map<String, dynamic> json =
      await userController.registerUser(name, email, password);

      expect(json['nome'], name);
      expect(json['email'], email);
      expect(json['senha'], password);
    });

    test("Should return a custom error message when the email is already registered (HTTP 400 Bad Request)", () async {
      when(mockService.postUser(name, email, password)).thenAnswer((_) async => http.Response('Bad Request', 400));

      Map<String, dynamic> json =
      await userController.registerUser(name, email, password);

      expect(json['error'], 'E-mail já está em uso');
    });

    test("Should return a custom error message when a internal server error occurs (HTTP 500 Internal Server Error)", () async {
      when(mockService.postUser(name, email, password)).thenAnswer((_) async => http.Response('Internal Server Error', 500));

      Map<String, dynamic> json =
      await userController.registerUser(name, email, password);

      expect(json['error'], 'Erro na conexão com o servidor');
    });


  });
}
