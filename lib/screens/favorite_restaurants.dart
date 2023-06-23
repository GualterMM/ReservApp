import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/back_button.dart';
import 'package:reservapp/assets/widgets/list_restaurants.dart';
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
    Restaurant(1, "Vereda", "Rua ABC  ", "19h00 - 00h00", 10, "P", "Melhor pizzaria de Pouso Alegre!", "https://www.minasgerais.com.br/imagens/atracoes/1523477577MWcuGlqNJ3.jpg", "https://veredapizzaria.com.br/gallery_gen/b3b204b265029305234d4dfb5132b5c3_751x475.63333333333.jpg"),
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
