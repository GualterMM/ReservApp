import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/back_button.dart';
import 'package:reservapp/assets/widgets/list_restaurants.dart';

import '../assets/widgets/restaurant_card.dart';
import '../models/restaurant.dart';

class FavoriteRestaurants extends StatelessWidget{
  const FavoriteRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: TelaFavoritos()),
    );
  }

}

class TelaFavoritos extends StatelessWidget{
  TelaFavoritos({super.key});

  // TODO: Remover modelo de teste
  late List<Restaurant> restaurantList = [
    Restaurant(1, "Costela no Bafo", "PA", "12h00 - 17h00", 4, "R", "Comidinha hmm", "https://media-cdn.tripadvisor.com/media/photo-s/05/c2/83/34/costela-no-bafo.jpg", ""),
    Restaurant(2, "Iwata Sushi", "PA", "19h00 - 23h00", 5, "K", "Japa hmm", "https://pr0.nicelocal.br.com/l-H8-PM_PWuAyv9z7-Ur-A/2000x1500,q75/4px-BW84_n3lJhgQGe6caI1vAfZfD8yOKqS4dO4Py5dVeCDAtW6xSQ3E2jFMD_F9x4cSVzPPFOz9KtIckfFPhOetq2LpWfalnI9_Dv1FNEerk4AgI1-JQHqN8sqFSM5oaRmT7TL6RHM", ""),
    Restaurant(3, "Vereda", "PA", "19h00 - 23h00", 3, "P", "Pizza hmm", "https://static.toiimg.com/thumb/56933159.cms?imgsize=686279&width=800&height=800", ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
                child: Align(
                  alignment: Alignment.topLeft,
                    child: backButton(context)
                )
            ),
            const Expanded(
              flex: 7,
                child: Text(
                  "Restaurantes Favoritos",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          height: 500,
          child: listRestaurants(restaurantList, context)
        ),
      ],
    );
  }

}
