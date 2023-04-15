import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/small_info_container.dart';

Widget restaurantCard (name, picture, score){
  return SizedBox(
    height: 100,
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
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
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 2.5,
                child: iconTextRoundedContainer(Icons.star, score),
              )
          ),
        ],
      ),
    ),
  );
}