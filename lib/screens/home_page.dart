import 'package:flutter/material.dart';

import '../assets/widgets/restaurant_card.dart';

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
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              child: Text('Usuário'),
            ),
            ListTile(
              title: Text('Minhas Reservas'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Favoritos'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () {},
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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 500,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          restaurantCard(
              "Costela no Bafo",
              "https://media-cdn.tripadvisor.com/media/photo-s/05/c2/83/34/costela-no-bafo.jpg",
              "4.5"),
          restaurantCard(
              "Iwata Sushi",
              "https://pr0.nicelocal.br.com/l-H8-PM_PWuAyv9z7-Ur-A/2000x1500,q75/4px-BW84_n3lJhgQGe6caI1vAfZfD8yOKqS4dO4Py5dVeCDAtW6xSQ3E2jFMD_F9x4cSVzPPFOz9KtIckfFPhOetq2LpWfalnI9_Dv1FNEerk4AgI1-JQHqN8sqFSM5oaRmT7TL6RHM",
              "5.0"),
          restaurantCard(
              "Vereda",
              "https://static.toiimg.com/thumb/56933159.cms?imgsize=686279&width=800&height=800",
              "4.5"),
        ],
      ),
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
