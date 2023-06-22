import 'package:mockito/mockito.dart';
import 'package:reservapp/services/restaurant_menu_service.dart';
import 'package:mockito/annotations.dart';
import 'restaurant_menu_service_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:reservapp/routes/router.dart' as router;
import 'package:reservapp/assets/constants/consts.dart' as constants;

@GenerateMocks([http.Client])
void main(){
  group("RestaurantMenuService tests for fetching items of a menu", () {
    late http.Client mockClient;
    late RestaurantMenuService restaurantMenuService;
    String restaurantId = '1';

    setUp(() {
      mockClient = MockClient();
      restaurantMenuService = RestaurantMenuService(mockClient);
    });

    test("Should return an HTTP 200 OK with a response body containing a JSON list with menu items when making a successful request", () async {
      when(mockClient.get(router.listItemsByRestaurant(constants.LOCAL_HOST,
          {'q' : restaurantId}))).thenAnswer((_) async => http.Response(
        '''
        [
          {
            "id": 1,
            "nome": "Pizza 1",
            "preco": 10,
            "tipoItem": "Pizza",
            "descricao": "Pizza de Calabresa",
            "restaurante_id": 1
          }
        ]
        ''',
        200
      ));

      http.Response response = await restaurantMenuService.getItems(restaurantId);

      expect(response.statusCode, 200);
      expect(response.body, isNot(equals('null')));
    });

    test("Should throw an exception on an unsuccessful request", () async {
      when(mockClient.get(router.listItemsByRestaurant(constants.LOCAL_HOST,
          {'q' : restaurantId}))).thenThrow(Exception());

      expect(restaurantMenuService.getItems(restaurantId), throwsException);
    });
  });
}