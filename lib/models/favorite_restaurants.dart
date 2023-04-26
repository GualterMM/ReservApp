import 'package:reservapp/models/restaurant.dart';

class FavoriteRestaurant{
  final int idUser;
  Restaurant restaurant;

  FavoriteRestaurant(this.idUser, this.restaurant);
}