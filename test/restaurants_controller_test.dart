import 'package:mockito/mockito.dart';
import 'package:reservapp/controllers/restaurants_controller.dart';
import 'package:reservapp/services/restaurants_service.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'restaurants_controller_test.mocks.dart';

@GenerateMocks([RestaurantsService])
void main(){
  group("RestaurantsController tests for displaying all restaurants", () {
    late RestaurantsService mockService;
    late RestaurantsController restaurantsController;

    setUp(() {
      mockService = MockRestaurantsService();
      restaurantsController = RestaurantsController(mockService);
    });

    test("Should return a JSON list with restaurant info when the service return a HTTP 200 OK", () async {
      when(mockService.getRestaurants()).thenAnswer((_) async => http.Response(
        '''
        [
          {
            "id": 1,
            "nome": "Vereda",
            "endereco": "Rua ABC",
            "horariosFuncionamento": "19:00 - 00:00",
            "avaliacao": 10,
            "descricao": "Melhor pizzaria de Pouso Alegre!",
            "imagemFundoURL": "https://www.minasgerais.com.br/imagens/atracoes/1523477577MWcuGlqNJ3.jpg",
            "iconeURL": "https://veredapizzaria.com.br/gallery_gen/b3b204b265029305234d4dfb5132b5c3_751x475.63333333333.jpg",
            "categoria": "P"
          },
          {
            "id": 2,
            "nome": "Iwata",
            "endereco": "Rua CBT",
            "horariosFuncionamento": "17:30 - 23:00",
            "avaliacao": 10,
            "descricao": "Rodízio de Sushi toda noite!",
            "imagemFundoURL": "https://scontent.fppy4-1.fna.fbcdn.net/v/t39.30808-6/320530861_553801492879363_7377150096181133567_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=e3f864&_nc_ohc=XgKcEvBMO1EAX-psDii&_nc_ht=scontent.fppy4-1.fna&oh=00_AfA3naoUPt143Wm6kWBdqN0vS2AE2Wb1wlGb0uQQLKcnXA&oe=6498B726",
            "iconeURL": "https://s3-us-west-2.amazonaws.com/anotaai/pages/1669728264194blob",
            "categoria": "J"
          }
        ]
        ''',
        200
      ));

      List<Map<String, dynamic>> jsonResponse = await restaurantsController.showRestaurants();

      expect(jsonResponse[0].containsKey("error"), false);
      expect(jsonResponse[0]['id'], 1);
      expect(jsonResponse[1]['id'], 2);
    });
  });

  group("RestaurantsController tests for displaying a restaurant by its name", () {
    late RestaurantsService mockService;
    late RestaurantsController restaurantsController;
    String name = 'Vereda';

    setUp(() {
      mockService = MockRestaurantsService();
      restaurantsController = RestaurantsController(mockService);
    });

    test("Should return a JSON object containing info about the given restaurant's name when the service return a HTTP 200 OK", () async {
      when(mockService.getRestaurantByName(name)).thenAnswer((_) async => http.Response(
          '''
          {
            "id": 1,
            "nome": "Vereda",
            "endereco": "Rua ABC",
            "horariosFuncionamento": "19:00 - 00:00",
            "avaliacao": 10,
            "descricao": "Melhor pizzaria de Pouso Alegre!",
            "imagemFundoURL": "https://www.minasgerais.com.br/imagens/atracoes/1523477577MWcuGlqNJ3.jpg",
            "iconeURL": "https://veredapizzaria.com.br/gallery_gen/b3b204b265029305234d4dfb5132b5c3_751x475.63333333333.jpg",
            "categoria": "P"
          }
        ''',
          200
      ));

      Map<String, dynamic> jsonResponse = await restaurantsController.showRestaurantByName(name);

      expect(jsonResponse.containsKey("error"), false);
      expect(jsonResponse['nome'], name);
    });
  });

  group("RestaurantsController tests for displaying restaurants by type", () {
    late RestaurantsService mockService;
    late RestaurantsController restaurantsController;
    String type = 'P';

    setUp(() {
      mockService = MockRestaurantsService();
      restaurantsController = RestaurantsController(mockService);
    });

    test("Should return a JSON object containing info about the given restaurant's name when the service return a HTTP 200 OK", () async {
      when(mockService.getRestaurantsByType(type)).thenAnswer((_) async => http.Response(
          '''
          [
            {
              "id": 1,
              "nome": "Vereda",
              "endereco": "Rua ABC",
              "horariosFuncionamento": "19:00 - 00:00",
              "avaliacao": 10,
              "descricao": "Melhor pizzaria de Pouso Alegre!",
              "imagemFundoURL": "https://www.minasgerais.com.br/imagens/atracoes/1523477577MWcuGlqNJ3.jpg",
              "iconeURL": "https://veredapizzaria.com.br/gallery_gen/b3b204b265029305234d4dfb5132b5c3_751x475.63333333333.jpg",
              "categoria": "P"
            }
          ]
        ''',
          200
      ));

      List<Map<String, dynamic>> jsonResponse = await restaurantsController.showRestaurantsByType(type);

      expect(jsonResponse[0].containsKey("error"), false);
      expect(jsonResponse[0]['categoria'], type);
    });
  });

  group("RestaurantsController tests for displaying a restaurant by its id", () {
    late RestaurantsService mockService;
    late RestaurantsController restaurantsController;
    int restaurantId = 1;

    setUp(() {
      mockService = MockRestaurantsService();
      restaurantsController = RestaurantsController(mockService);
    });

    test("Should return a JSON object containing info about the given restaurant's name when the service return a HTTP 200 OK", () async {
      when(mockService.getRestaurantById(restaurantId)).thenAnswer((_) async => http.Response(
          '''
          {
            "id": 1,
            "nome": "Vereda",
            "endereco": "Rua ABC",
            "horariosFuncionamento": "19:00 - 00:00",
            "avaliacao": 10,
            "descricao": "Melhor pizzaria de Pouso Alegre!",
            "imagemFundoURL": "https://www.minasgerais.com.br/imagens/atracoes/1523477577MWcuGlqNJ3.jpg",
            "iconeURL": "https://veredapizzaria.com.br/gallery_gen/b3b204b265029305234d4dfb5132b5c3_751x475.63333333333.jpg",
            "categoria": "P"
          }
        ''',
          200
      ));

      Map<String, dynamic> jsonResponse = await restaurantsController.showRestaurantById(restaurantId);

      expect(jsonResponse.containsKey("error"), false);
      expect(jsonResponse['id'], restaurantId);
    });
  });

  group("RestaurantsController tests for handling HTTP errors from the service response", () {
    late RestaurantsService mockService;
    late RestaurantsController restaurantsController;

    setUp(() {
      mockService = MockRestaurantsService();
      restaurantsController = RestaurantsController(mockService);
    });

    test("Should return a JSON object {'error' : 'Não existem restaurantes disponíveis para listagem'} when the service returns an HTTP 404 Error", () async {
      when(mockService.getRestaurants()).thenAnswer((_) async => http.Response("Not Found", 404));

      List<Map<String, dynamic>> jsonResponse = await restaurantsController.showRestaurants();

      expect(jsonResponse[0]['error'], 'Não existem restaurantes disponíveis para listagem');
    });

    test("Should return a JSON object {'error' : 'Erro na conexão com o servidor'} when the service returns an HTTP 500 Error", () async {
      when(mockService.getRestaurants()).thenAnswer((_) async => http.Response("Internal Server Error", 500));

      List<Map<String, dynamic>> jsonResponse = await restaurantsController.showRestaurants();

      expect(jsonResponse[0]['error'], 'Erro na conexão com o servidor');
    });

    test("Should return a JSON object {'error' : 'Erro 'STATUSCODE' - 'RESPONSE BODY''} for other HTTP Errors", () async {
      when(mockService.getRestaurants()).thenAnswer((_) async => http.Response("Bad Request", 400));

      List<Map<String, dynamic>> jsonResponse = await restaurantsController.showRestaurants();

      expect(jsonResponse[0]['error'], 'Erro 400 - Bad Request');
    });
  });


}
