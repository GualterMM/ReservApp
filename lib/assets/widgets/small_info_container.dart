import 'package:flutter/material.dart';

Widget smallInfoContainer(icon, text){
  return Container(
    padding: const EdgeInsets.only(left: 8, right: 8),
    height: 30,
    child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
                icon,
                color: Colors.deepOrange,
                size: 14
            ),
            Text(
              text.toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14
              ),
            ),
          ],
        )
    ),
  );
}