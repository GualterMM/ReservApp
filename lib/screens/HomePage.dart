import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: showCity,
          centerTitle: true,
          leading: const Icon(Icons.menu),
          elevation: 0,
        ),
        body: ListView(
          children: const [
            SearchRestaurant(),
            FilterList(),
            RestaurantList(),
          ],
        ));
  }
}

Widget showCity = (Row(
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
            Text(
              "Escolha o melhor para você!",
              textScaleFactor: 1.3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Procurar',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: Icon(Icons.search)),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: 35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text("Todos")),
          SizedBox(width: 12),
          FilterButton("Japa"),
          SizedBox(width: 12),
          FilterButton("Pizza"),
          SizedBox(width: 12),
          FilterButton("Hamburguer"),
          SizedBox(width: 12),
          FilterButton("Esfirra"),
          SizedBox(width: 12),
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
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 400,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          RestaurantCard("Costela no Bafo", "https://media-cdn.tripadvisor.com/media/photo-s/05/c2/83/34/costela-no-bafo.jpg", "4.5"),
          RestaurantCard("Iwata Sushi", "https://pr0.nicelocal.br.com/l-H8-PM_PWuAyv9z7-Ur-A/2000x1500,q75/4px-BW84_n3lJhgQGe6caI1vAfZfD8yOKqS4dO4Py5dVeCDAtW6xSQ3E2jFMD_F9x4cSVzPPFOz9KtIckfFPhOetq2LpWfalnI9_Dv1FNEerk4AgI1-JQHqN8sqFSM5oaRmT7TL6RHM", "5.0"),
          RestaurantCard("Vereda", "https://static.toiimg.com/thumb/56933159.cms?imgsize=686279&width=800&height=800", "4.5"),
        ],
      ),
    );
  }
}

Widget RestaurantCard (name, picture, score){
  return SizedBox(
    height: 100,
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(picture),
                  radius: 30,
                )),
            Expanded(flex: 5, child: Text(name)),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 3,
                              child: Icon(Icons.star, color: Colors.deepOrange, size: 10)
                          ),
                          Expanded(
                              flex: 7,
                              child: Text(
                                score,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 10
                                ),
                              )
                          ),
                        ],
                      )
                  ),
                )
            ),
          ],
        ),
      ),
    ),
  );
}

Widget FilterButton(buttonText) {
  return FilledButton(
      onPressed: null,
      style: FilledButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Text(buttonText));
}
