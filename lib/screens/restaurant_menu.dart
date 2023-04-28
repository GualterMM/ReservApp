import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/list_menu.dart';
import 'package:reservapp/assets/widgets/small_info_container.dart';

import '../assets/widgets/back_button.dart';
import '../models/menu_item.dart';

class RestaurantMenu extends StatelessWidget {
  const RestaurantMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TelaCardapio(),
      ),
    );
  }
}

class TelaCardapio extends StatefulWidget {
  const TelaCardapio({super.key});

  @override
  State<TelaCardapio> createState() {
    return _TelaCardapio();
  }
}

class _TelaCardapio extends State<TelaCardapio> {
  List<MenuItem> menu = [
    MenuItem(1, "Comida 1", 10.00, "Comida", "Comida hmm"),
    MenuItem(2, "Comida 2", 20.00, "Comida", "Comida hmm"),
    MenuItem(3, "Comida 3", 30.00, "Comida", "Comida hmm"),
    MenuItem(4, "Comida 1", 10.00, "Comida", "Comida hmm"),
    MenuItem(5, "Comida 2", 20.00, "Comida", "Comida hmm"),
    MenuItem(6, "Bebida 1", 20.00, "Bebida", "Bebida hmm"),
    MenuItem(7, "Bebida 2", 10.00, "Bebida", "Bebida hmm"),
    MenuItem(8, "Bebida 1", 20.00, "Bebida", "Bebida hmm"),
    MenuItem(9, "Bebida 2", 10.00, "Bebida", "Bebida hmm"),
    MenuItem(8, "Bebida 1", 20.00, "Bebida", "Bebida hmm"),
    MenuItem(9, "Bebida 2", 10.00, "Bebida", "Bebida hmm"),
    MenuItem(10, "Acompanhamento 1", 20.00, "Acompanhamento", "Acompanhamento hmm"),
    MenuItem(11, "Acompanhamento 2", 30.00, "Acompanhamento", "Acompanhamento hmm"),
  ];

  List<String> types = ['Comida', 'Bebida', 'Acompanhamento'];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // TODO: Utilizar a URL do restaurante
        Column(
          children: [
            Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Image.network(
                      "https://images.pexels.com/photos/67468/pexels-photo-67468.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      height: 300,
                      fit: BoxFit.cover,
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Costela no Bafo",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          //padding: const EdgeInsets.all(20.0),
                          child: Ink(
                            decoration: ShapeDecoration(
                              color: Colors.orange[100],
                              shape: const CircleBorder(),
                            ),
                            child: IconButton(
                              iconSize: 30,
                              icon: Icon(Icons.location_pin,
                                  color: Theme.of(context).colorScheme.primary),
                              color: Theme.of(context).colorScheme.onPrimary,
                              onPressed: () => {Navigator.pop(context)},
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          //padding: const EdgeInsets.all(20.0),
                          child: Ink(
                            decoration: ShapeDecoration(
                              color: Colors.orange[100],
                              shape: const CircleBorder(),
                            ),
                            child: IconButton(
                              iconSize: 30,
                              icon: Icon(Icons.favorite,
                                  color: Theme.of(context).colorScheme.primary),
                              color: Theme.of(context).colorScheme.onPrimary,
                              onPressed: () => {Navigator.pop(context)},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 70, child: smallInfoContainer(Icons.star, "5")),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                          "Pratos de carne grelhados de estilo familiar, combinados com cerveja e cocktails em um ambiente rústico e animado.",
                        textScaleFactor: 1.1,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: const Text(
                          'Reservar',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
        Align(
            alignment: Alignment.topLeft, child: backButton(context)
        ),
        DraggableScrollableSheet(
          builder: (context, controller) {
            return Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: listMenu(menu, types, controller)
            );
          },
          initialChildSize: 0.15,
          minChildSize: 0.15,
          maxChildSize: 1.0,
        )
      ],
    );
  }
}
