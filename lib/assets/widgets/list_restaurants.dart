import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/restaurant_card.dart';
import '../../models/restaurant.dart';

Widget listRestaurants(List<Restaurant> restaurantList){
  // TODO: Pegar restaurantes na nuvem

  // TODO: Associar os dados aos modelos

  // Criar componente
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: restaurantList.length,
      itemBuilder: (BuildContext context, int index) {
        return restaurantCard(restaurantList[index].name, restaurantList[index].backgroundPictureUrl, restaurantList[index].rating.toString());
      }
  );
}