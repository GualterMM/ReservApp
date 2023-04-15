import 'package:flutter/material.dart';

Widget backButton(BuildContext context){
  return Container(
    padding: const EdgeInsets.all(20.0),
    child: Ink(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: const CircleBorder(),
      ),
      child: IconButton(
        iconSize: 30,
        icon: const Icon(Icons.arrow_back),
        color: Theme.of(context).colorScheme.onPrimary,
        onPressed: () => {Navigator.pop(context)},
      ),
    ),
  );
}