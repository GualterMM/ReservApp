import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/back_button.dart';

import '../assets/widgets/restaurant_card.dart';

class FavoriteRestaurants extends StatelessWidget{
  const FavoriteRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: TelaFavoritos()),
    );
  }

}

class TelaFavoritos extends StatelessWidget{
  const TelaFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
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
        ),
      ],
    );
  }

}