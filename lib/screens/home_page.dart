import 'package:flutter/material.dart';
import 'package:reservapp/main.dart';
import 'package:reservapp/models/menu_item.dart';
import 'package:reservapp/screens/check_reservations.dart';
import 'package:reservapp/screens/favorite_restaurants.dart';
import 'package:reservapp/screens/restaurant_menu.dart';

import '../assets/widgets/list_restaurants.dart';
import '../assets/widgets/restaurant_card.dart';
import '../models/menu.dart';
import '../models/restaurant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: showCity,
        centerTitle: true,

        elevation: 0,
      ),

      body: ListView(
        children: const [
          SearchRestaurant(),
          FilterList(),
          RestaurantList(),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 90,
              child: DrawerHeader(
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Usuário"),
                  trailing: Icon(Icons.edit),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            ListTile(
              title: const Text('Minhas Reservas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckReservations()),
                );
              },
            ),
            ListTile(
              title: const Text('Favoritos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoriteRestaurants()),
                );
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
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
    )
);

class SearchRestaurant extends StatefulWidget {
  const SearchRestaurant({super.key});

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
  const FilterList({super.key});

  @override
  State<FilterList> createState() => _FilterList();
}

class _FilterList extends State<FilterList> {
  static const spacer = SizedBox(width: 12);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: 35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text("Todos")),
          spacer,
          FilterButton("Japa"),
          spacer,
          FilterButton("Pizza"),
          spacer,
          FilterButton("Hamburguer"),
          spacer,
          FilterButton("Esfirra"),
          spacer,
          FilterButton("Marmita"),
        ],
      ),
    );
  }
}

class RestaurantList extends StatefulWidget {
  const RestaurantList({super.key});

  @override
  State<StatefulWidget> createState() => _RestaurantList();
}

class _RestaurantList extends State<RestaurantList> {
  // Teste dos modelos
  // TODO: Remover esse teste
  late List<Restaurant> restaurantList = [
    Restaurant(1, "Costela no Bafo", "PA", "12h00 - 17h00", 4, "R", "Pratos de carne grelhados de estilo familiar, combinados com cerveja e cocktails em um ambiente rústico e animado.", "https://media-cdn.tripadvisor.com/media/photo-s/05/c2/83/34/costela-no-bafo.jpg", ""),
    Restaurant(2, "Iwata Sushi", "PA", "19h00 - 23h00", 5, "K", "Rodízio de sushi em Pouso Alegre", "https://pr0.nicelocal.br.com/l-H8-PM_PWuAyv9z7-Ur-A/2000x1500,q75/4px-BW84_n3lJhgQGe6caI1vAfZfD8yOKqS4dO4Py5dVeCDAtW6xSQ3E2jFMD_F9x4cSVzPPFOz9KtIckfFPhOetq2LpWfalnI9_Dv1FNEerk4AgI1-JQHqN8sqFSM5oaRmT7TL6RHM", ""),
    Restaurant(3, "Vereda", "PA", "19h00 - 23h00", 3, "P", "Pizza hmm", "https://static.toiimg.com/thumb/56933159.cms?imgsize=686279&width=800&height=800", ""),
  ];
  // Fim do teste dos modelos

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 500,
      child: listRestaurants(restaurantList, context),
    );
  }
}

Widget FilterButton(buttonText) {
  return FilledButton(
      onPressed: null,
      style: FilledButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Text(buttonText));
}