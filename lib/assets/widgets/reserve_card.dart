import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/small_info_container.dart';

Widget reserveCard (name, time, guests){
  return SizedBox(
    height: 100,
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("23", textScaleFactor: 2.0,),
                  Text("MAR"),
                ],
              )
          ),
          Expanded(flex: 5, child: Text(name)),
          Expanded(
              flex: 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  smallInfoContainer(Icons.timelapse, time),
                  smallInfoContainer(Icons.people, guests),
                ]
              )
          ),
        ],
      ),
    ),
  );
}