import 'package:mockito/mockito.dart';
import 'package:reservapp/controllers/restaurant_menu_controller.dart';
import 'package:reservapp/services/restaurant_menu_service.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'restaurant_menu_controller_test.mocks.dart';

@GenerateMocks([RestaurantMenuService])
void main(){
  group("RestaurantMenuController tests for displaying data about the restaurant's menu", () {
    late RestaurantMenuService mockService;
    late RestaurantMenuController restaurantMenuController;
    String restaurantId = '1';

    setUp(() {
      mockService = MockRestaurantMenuService();
      restaurantMenuController = RestaurantMenuController(mockService);
    });

    test("Should return a JSON list with the restaurant's menu when the service return a HTTP 200 OK", () async {
      when(mockService.getItems(restaurantId)).thenAnswer((_) async => http.Response(
        '''          
          [
            {
              "id": 1,
              "nome": "Pizza 1",
              "preco": 10,
              "tipoItem": "Pizza",
              "descricao": "Pizza de Calabresa",
              "restaurante_id": 1
            },
            {
              "id": 2,
              "nome": "Pizza 2",
              "preco": 10,
              "tipoItem": "Pizza",
              "descricao": "Pizza de Marguerita",
              "restaurante_id": 1
            }
          ]
        ''',
        200
      ));

      List<Map<String, dynamic>> jsonResponse = await restaurantMenuController.showItems(restaurantId);

      expect(jsonResponse[0].containsKey("error"), false);

      expect(jsonResponse[0]['id'], 1);
      expect(jsonResponse[0]['restaurante_id'], int.parse(restaurantId));

      expect(jsonResponse[1]['id'], 2);
      expect(jsonResponse[1]['restaurante_id'], int.parse(restaurantId));
    });
  });

  group("RestaurantMenuController tests for handling HTTP errors from the service response", () {
    late RestaurantMenuService mockService;
    late RestaurantMenuController restaurantMenuController;
    String restaurantId = '1';


    setUp(() {
      mockService = MockRestaurantMenuService();
      restaurantMenuController = RestaurantMenuController(mockService);
    });

    test("Should return a JSON object {'error' : 'Não existem items disponíveis para esse restaurante'} when the service returns an HTTP 404 Error", () async {
      when(mockService.getItems(restaurantId)).thenAnswer((_) async => http.Response("Not Found", 404));

      List<Map<String, dynamic>> jsonResponse = await restaurantMenuController.showItems(restaurantId);

      expect(jsonResponse[0]['error'], 'Não existem items disponíveis para esse restaurante');
    });

    test("Should return a JSON object {'error' : 'Erro na conexão com o servidor'} when the service returns an HTTP 500 Error", () async {
      when(mockService.getItems(restaurantId)).thenAnswer((_) async => http.Response("Internal Server Error", 500));

      List<Map<String, dynamic>> jsonResponse = await restaurantMenuController.showItems(restaurantId);

      expect(jsonResponse[0]['error'], 'Erro na conexão com o servidor');
    });

    test("Should return a JSON object {'error' : 'Erro 'STATUSCODE' - 'RESPONSE BODY''} for other HTTP Errors", () async {
      when(mockService.getItems(restaurantId)).thenAnswer((_) async => http.Response("Bad Request", 400));

      List<Map<String, dynamic>> jsonResponse = await restaurantMenuController.showItems(restaurantId);

      expect(jsonResponse[0]['error'], 'Erro 400 - Bad Request');
    });
  });
}