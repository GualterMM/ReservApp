import 'package:mockito/mockito.dart';
import 'package:reservapp/services/restaurants_service.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'restaurants_service_test.mocks.dart';
import 'package:http/http.dart' as http;
import 'package:reservapp/routes/router.dart' as router;
import 'package:reservapp/assets/constants/consts.dart' as constants;

@GenerateMocks([http.Client])
void main() {
  group("RestaurantsService tests for fetching all restaurants", () {
    late MockClient mockClient;
    late RestaurantsService restaurantsService;

    setUp(() {
      mockClient = MockClient();
      restaurantsService = RestaurantsService(mockClient);
    });

    test("Should return an HTTP 200 OK, with the response body containing a JSON, when making a successful request", () async {
      when(mockClient.get(router.listRestaurantsRoute(constants.LOCAL_HOST)))
          .thenAnswer((_) async => http.Response('''{
          "id": 1,
          "nome": "Vereda",
          "endereco": "Rua ABC",
          "horariosFuncionamento": "19:00 - 00:00",
          "avaliacao": 10,
          "descricao": "Melhor pizzaria de Pouso Alegre!",
          "imagemFundoURL": "https://www.minasgerais.com.br/imagens/atracoes/1523477577MWcuGlqNJ3.jpg",
          "iconeURL": "https://veredapizzaria.com.br/gallery_gen/b3b204b265029305234d4dfb5132b5c3_751x475.63333333333.jpg",
          "categoria": "P"
        }''', 200));

      http.Response response = await restaurantsService.getRestaurants();

      expect(response, isA<http.Response>());
      expect(response.statusCode, 200);
      expect(response.body, isNot(equals('null')));
    });

    test("Should throw an exception on an unsuccessful request", () {
      when(mockClient.get(router.listRestaurantsRoute(constants.LOCAL_HOST)))
          .thenThrow(Exception());

      expect(restaurantsService.getRestaurants(), throwsException);
    });
  });

  group("RestaurantsService tests for fetching restaurants by type", () {
    late MockClient mockClient;
    late RestaurantsService restaurantsService;
    String type = 'P';

    setUp(() {
      mockClient = MockClient();
      restaurantsService = RestaurantsService(mockClient);
    });

    test("Should return an HTTP 200 OK, with the response body containing a JSON, when making a successful request", () async {
      when(mockClient.get(router.listRestaurantsByTypeRoute(constants.LOCAL_HOST, {'q' : type})))
          .thenAnswer((_) async => http.Response('''{
          "id": 1,
          "nome": "Vereda",
          "endereco": "Rua ABC",
          "horariosFuncionamento": "19:00 - 00:00",
          "avaliacao": 10,
          "descricao": "Melhor pizzaria de Pouso Alegre!",
          "imagemFundoURL": "https://www.minasgerais.com.br/imagens/atracoes/1523477577MWcuGlqNJ3.jpg",
          "iconeURL": "https://veredapizzaria.com.br/gallery_gen/b3b204b265029305234d4dfb5132b5c3_751x475.63333333333.jpg",
          "categoria": "P"
        }''', 200));

      http.Response response = await restaurantsService.getRestaurantsByType(type);

      expect(response, isA<http.Response>());
      expect(response.statusCode, 200);
      expect(response.body, isNot(equals('null')));
    });

    test("Should throw an exception on an unsuccessful request", () {
      when(mockClient.get(router.listRestaurantsByTypeRoute(constants.LOCAL_HOST, {'q' : type})))
          .thenThrow(Exception());

      expect(restaurantsService.getRestaurantsByType(type), throwsException);
    });
  });

  group("RestaurantsService tests for fetching a restaurant by its name", () {
    late MockClient mockClient;
    late RestaurantsService restaurantsService;
    String name = 'Vereda';

    setUp(() {
      mockClient = MockClient();
      restaurantsService = RestaurantsService(mockClient);
    });

    test("Should return an HTTP 200 OK, with the response body containing a JSON, when making a successful request", () async {
      when(mockClient.get(router.listRestaurantByNameRoute(constants.LOCAL_HOST, name)))
          .thenAnswer((_) async => http.Response('''{
          "id": 1,
          "nome": "Vereda",
          "endereco": "Rua ABC",
          "horariosFuncionamento": "19:00 - 00:00",
          "avaliacao": 10,
          "descricao": "Melhor pizzaria de Pouso Alegre!",
          "imagemFundoURL": "https://www.minasgerais.com.br/imagens/atracoes/1523477577MWcuGlqNJ3.jpg",
          "iconeURL": "https://veredapizzaria.com.br/gallery_gen/b3b204b265029305234d4dfb5132b5c3_751x475.63333333333.jpg",
          "categoria": "P"
        }''', 200));

      http.Response response = await restaurantsService.getRestaurantByName(name);

      expect(response, isA<http.Response>());
      expect(response.statusCode, 200);
      expect(response.body, isNot(equals('null')));
    });

    test("Should throw an exception on an unsuccessful request", () {
      when(mockClient.get(router.listRestaurantByNameRoute(constants.LOCAL_HOST, name)))
          .thenThrow(Exception());

      expect(restaurantsService.getRestaurantByName(name), throwsException);
    });
  });
}
