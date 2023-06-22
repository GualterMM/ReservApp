import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reservapp/auth/local_storage.dart';
import 'package:reservapp/controllers/restaurants_controller.dart';
import 'package:reservapp/screens/check_reservations.dart';
import 'package:reservapp/screens/favorite_restaurants.dart';
import 'package:reservapp/services/restaurants_service.dart';
import 'package:http/http.dart' as http;
import '../assets/widgets/list_restaurants.dart';
import '../models/restaurant.dart';
import '../models/user.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final StreamController<List<Map<String, dynamic>>>
      _restaurantsStreamController =
      StreamController<List<Map<String, dynamic>>>.broadcast();

  RestaurantsController _restaurantsController =
      RestaurantsController(RestaurantsService(http.Client()));

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late Future<User>? _future;

  @override
  void initState() {
    super.initState();
    _future = _myFuture();
  }

  Future<User> _myFuture() async {
    Map<String, dynamic> defaultUser = {
      'id': 0,
      'nome': 'Usuário',
      'email': '',
      'fotoURL': 'd'
    };

    User? futureUser = await LocalStorage().getUser();
    User user = futureUser ?? User.fromJson(defaultUser);

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: showCity,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SearchRestaurant(
            restaurantsStreamController: widget._restaurantsStreamController,
            restaurantsController: widget._restaurantsController,
          ),
          FilterList(
              restaurantsStreamController: widget._restaurantsStreamController,
              restaurantsController: widget._restaurantsController),
          RestaurantList(
              restaurantsStreamController: widget._restaurantsStreamController,
              restaurantsController: widget._restaurantsController),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 90,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: FutureBuilder<User>(
                  future: _future,
                  builder: (context, snapshot) {
                    Widget child;
                    if (snapshot.hasData) {
                      child = ListTile(
                        leading: CircleAvatar(
                          radius: 15.0,
                          backgroundColor:
                              Theme.of(context).colorScheme.onTertiary,
                          child: Image.network(
                            snapshot.data!.pictureUrl,
                            errorBuilder: (context, exception, stacktrace) {
                              return Image.asset(
                                  'lib/assets/images/default_icon.png');
                            },
                          ),
                        ),
                        title: Text(snapshot.data!.name),
                        trailing: const Icon(Icons.edit),
                      );
                    } else {
                      child = const CircularProgressIndicator();
                    }
                    return child;
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text('Minhas Reservas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CheckReservations()),
                );
              },
            ),
            ListTile(
              title: const Text('Favoritos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoriteRestaurants()),
                );
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () async {
                await LocalStorage().removeUser().then((value) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget showCity = GestureDetector(
    onTap: () => debugPrint('Location Selector'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.location_pin),
        Text(
          "Pouso Alegre",
          style: TextStyle(fontWeight: FontWeight.normal),
        )
      ],
    ));

class SearchRestaurant extends StatefulWidget {
  StreamController<List<Map<String, dynamic>>> restaurantsStreamController;
  RestaurantsController restaurantsController;

  SearchRestaurant(
      {super.key,
      required this.restaurantsStreamController,
      required this.restaurantsController});

  @override
  State<SearchRestaurant> createState() => _SearchRestaurant();
}

class _SearchRestaurant extends State<SearchRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Escolha o melhor para você!",
              textScaleFactor: 1.3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Procurar',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: const Icon(Icons.search)),
            ),
          ],
        ));
  }
}

class FilterList extends StatefulWidget {
  StreamController<List<Map<String, dynamic>>> restaurantsStreamController;
  RestaurantsController restaurantsController;

  FilterList(
      {super.key,
      required this.restaurantsStreamController,
      required this.restaurantsController});

  @override
  State<FilterList> createState() => _FilterList();
}

class _FilterList extends State<FilterList> {
  List<RadioModel> types = <RadioModel>[];

  @override
  void initState() {
    super.initState();

    types.add(RadioModel(true, "Todos", "T"));
    types.add(RadioModel(false, "Japa", "J"));
    types.add(RadioModel(false, "Pizza", "P"));
    types.add(RadioModel(false, "Esfirra", "E"));
    types.add(RadioModel(false, "Marmitex", "M"));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleButtonPressed(String type) async {
    if (type == "T") {
      try {
        List<Map<String, dynamic>> jsonResponse =
            await widget.restaurantsController.showRestaurants();
        widget.restaurantsStreamController.add(jsonResponse);
      } catch (error) {
        widget.restaurantsStreamController.addError(error);
      }
    } else {
      try {
        List<Map<String, dynamic>> jsonResponse = await widget
            .restaurantsController
            .showRestaurantsByType(type); // Primeira letra do nome do filtro
        widget.restaurantsStreamController.add(jsonResponse);
      } catch (error) {
        widget.restaurantsStreamController.addError(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: types.length, // Number of buttons in the row
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: types[index].isSelected ?
            FilledButton(
              onPressed: types[index].isSelected
                  ? () {}
                  : () => setState(() {
                        for (var element in types) {
                          element.isSelected = false;
                        }
                        types[index].isSelected = true;
                        _handleButtonPressed(types[index].type);
                      }),
              style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
              child: Text(types[index].buttonText),
            ) :
            OutlinedButton(
              onPressed: types[index].isSelected
                  ? null
                  : () => setState(() {
                for (var element in types) {
                  element.isSelected = false;
                }
                types[index].isSelected = true;
                _handleButtonPressed(types[index].type);
              }),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(types[index].buttonText, style: TextStyle(color: Theme.of(context).colorScheme.onBackground),),
            ),
          );
        },
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Container(
//     margin: const EdgeInsets.only(left: 20, right: 20),
//     height: 35,
//     child: ListView(
//       scrollDirection: Axis.horizontal,
//       children: [
//         FilledButton(
//             onPressed: () {},
//             style: FilledButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10))),
//             child: const Text("Todos")),
//         spacer,
//         FilledButton(
//             onPressed: () {},
//             style: FilledButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10))),
//             child: Text("Japa")),
//         spacer,
//         filterButton("Pizza"),
//         spacer,
//         filterButton("Hamburguer"),
//         spacer,
//         filterButton("Esfirra"),
//         spacer,
//         filterButton("Marmita"),
//       ],
//     ),
//   );
// }
}

class RestaurantList extends StatefulWidget {
  StreamController<List<Map<String, dynamic>>> restaurantsStreamController;
  RestaurantsController restaurantsController;

  RestaurantList(
      {super.key,
      required this.restaurantsStreamController,
      required this.restaurantsController});

  @override
  State<StatefulWidget> createState() => _RestaurantList();
}

class _RestaurantList extends State<RestaurantList> {
  void _fetchRestaurants() async {
    try {
      List<Map<String, dynamic>> jsonResponse =
          await widget.restaurantsController.showRestaurants();
      widget.restaurantsStreamController.add(jsonResponse);
    } catch (error) {
      widget.restaurantsStreamController.addError(error);
    }
  }

  @override
  void dispose() {
    widget.restaurantsStreamController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 500,
      child: StreamBuilder<List<Map<String, dynamic>>>(
        stream: widget.restaurantsStreamController.stream,
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          List<Widget> children;

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            // Recuperou os restaurantes com sucesso
            final List<Restaurant> restaurantList =
                snapshot.data!.map((restaurant) {
              return Restaurant(
                  restaurant['id'],
                  restaurant['nome'],
                  restaurant['endereco'],
                  restaurant['horariosFuncionamento'],
                  restaurant['avaliacao'],
                  restaurant['categoria'],
                  restaurant['descricao'],
                  restaurant['imagemFundoURL'],
                  restaurant['iconeURL']);
            }).toList();

            return listRestaurants(restaurantList, context);
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            // Não há nenhum restaurante
            children = const <Widget>[
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                      'Não foram encontrados nenhum restaurante na sua área :('))
            ];
          } else if (snapshot.hasError) {
            // Erro ao recuperar restaurantes
            children = const <Widget>[
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                      'Erro ao carregar os restaurantes. Verifique sua conexão com a internet.'))
            ];
          } else {
            // Carregando
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          );
        },
      ),
    );
  }
}

Widget filterButton(buttonText) {
  return FilledButton(
      onPressed: null,
      style: FilledButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Text(buttonText));
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String type;

  RadioModel(this.isSelected, this.buttonText, this.type);
}
