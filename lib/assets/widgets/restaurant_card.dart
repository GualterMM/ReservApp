import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/small_info_container.dart';
import 'package:reservapp/models/restaurant.dart';

import '../../screens/restaurant_menu.dart';

Widget restaurantCard (Restaurant restaurant, BuildContext context){
  return SizedBox(
    height: 100,
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RestaurantMenu(restaurant: restaurant)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onTertiary,
                  radius: 30,
                  child: ClipOval(
                    child: Image.network(
                        restaurant.iconPictureUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, exception, stacktrace) {
                          return Image.asset('lib/assets/images/default_icon_restaurant.png');
                      },
                    ),
                  ),
                )),
            Expanded(flex: 5, child: Text(restaurant.name)),
            Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 2.5,
                  child: smallInfoContainer(Icons.star, restaurant.rating),
                )
            ),
          ],
        ),
      ),
    ),
  );
}