import 'menu.dart';

class Restaurant {
  final int idRestaurant;
  final String name;
  final String address;
  final String workHours;
  final int rating;
  final String type;
  final Menu restaurantMenu;
  String description = "";
  String backgroundPictureUrl = "";
  String iconPictureUrl = "";

  Restaurant(
      this.idRestaurant,
      this.name,
      this.address,
      this.workHours,
      this.rating,
      this.type,
      this.description,
      this.backgroundPictureUrl,
      this.iconPictureUrl,
      this.restaurantMenu
      );
}