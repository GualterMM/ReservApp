import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/list_menu.dart';
import 'package:reservapp/assets/widgets/small_info_container.dart';
import 'package:reservapp/controllers/favorite_controller.dart';
import 'package:reservapp/controllers/restaurant_menu_controller.dart';
import 'package:reservapp/models/restaurant.dart';
import 'package:reservapp/screens/reservation.dart';
import 'package:reservapp/services/favorite_service.dart';
import 'package:reservapp/services/restaurant_menu_service.dart';
import 'package:http/http.dart' as http;

import '../assets/widgets/back_button.dart';
import '../models/menu_item.dart';

class RestaurantMenu extends StatelessWidget {
  Restaurant restaurant;

  RestaurantMenu({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TelaCardapio(restaurant: restaurant),
      ),
    );
  }
}

class TelaCardapio extends StatefulWidget {
  Restaurant restaurant;

  TelaCardapio({super.key, required this.restaurant});

  @override
  State<TelaCardapio> createState() {
    return _TelaCardapio();
  }
}

class _TelaCardapio extends State<TelaCardapio> {
  static http.Client httpClient = http.Client();
  RestaurantMenuController restaurantMenuController =
      RestaurantMenuController(RestaurantMenuService(httpClient));

  FavoriteController favoriteController =
      FavoriteController(FavoriteService(httpClient));

  Future<List<Map<String, dynamic>>> _getMenu(int restaurantId) async {
    List<Map<String, dynamic>> jsonResponse =
        await restaurantMenuController.showItems(restaurantId.toString());

    return jsonResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.network(
                  widget.restaurant.backgroundPictureUrl,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, exception, stacktrace) {
                    return Image.asset(
                      'lib/assets/images/food.png',
                      height: 300,
                      fit: BoxFit.cover,
                    );
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Text(
                      widget.restaurant.name,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Ink(
                        decoration: ShapeDecoration(
                          color: Colors.orange[100],
                          shape: const CircleBorder(),
                        ),
                        child: IconButton(
                          iconSize: 30,
                          icon: Icon(Icons.location_pin,
                              color: Theme.of(context).colorScheme.primary),
                          color: Theme.of(context).colorScheme.onPrimary,
                          onPressed: () => {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Localização copiada.'),
                            ))
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      //padding: const EdgeInsets.all(20.0),
                      child: Ink(
                        decoration: ShapeDecoration(
                          color: Colors.orange[100],
                          shape: const CircleBorder(),
                        ),
                        child: IconButton(
                          iconSize: 30,
                          icon: Icon(Icons.favorite,
                              color: Theme.of(context).colorScheme.primary),
                          color: Theme.of(context).colorScheme.onPrimary,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Restaurante favoritado.'),
                            ));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: 70,
                          child: smallInfoContainer(
                              Icons.star, widget.restaurant.rating.toString())),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.restaurant.description,
                    textScaleFactor: 1.1,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Reservation()),
                      );
                    },
                    child: const Text(
                      'Reservar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(alignment: Alignment.topLeft, child: backButton(context)),
        DraggableScrollableSheet(
          builder: (context, controller) {
            return Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: _getMenu(widget.restaurant.idRestaurant),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      List<Widget> children;

                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        final List<MenuItem> menuList = snapshot.data!
                            .map((e) => MenuItem.fromJson(e))
                            .toList();
                        return listMenu(menuList, controller);
                      } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                        children = const <Widget>[
                          Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                  'Esse restaurante não disponibilizou um cardápio.'))
                        ];
                      } else if (snapshot.hasError) {
                        children = const <Widget>[
                          Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                  'Erro ao carregar cardápio. Verifique sua conexão com a internet.'))
                        ];
                      } else {
                        children = const <Widget>[
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('Carregando...'),
                          ),
                        ];
                      }

                      return Column(
                        children: children,
                      );
                    }) // listMenu(menu, controller)
                );
          },
          initialChildSize: 0.21,
          minChildSize: 0.21,
          maxChildSize: 1.0,
        )
      ],
    );
  }
}
