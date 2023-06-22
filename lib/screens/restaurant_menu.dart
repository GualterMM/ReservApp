import 'package:flutter/material.dart';
import 'package:reservapp/assets/widgets/list_menu.dart';
import 'package:reservapp/assets/widgets/small_info_container.dart';
import 'package:reservapp/models/restaurant.dart';
import 'package:reservapp/screens/reservation.dart';

import '../assets/widgets/back_button.dart';
import '../models/menu_item.dart';

class RestaurantMenu extends StatelessWidget {
  Restaurant restaurant;

  RestaurantMenu({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TelaCardapio(restaurant: restaurant),
      ),
    );
  }
}

class TelaCardapio extends StatefulWidget {
  Restaurant restaurant;
  TelaCardapio({super.key, required this.restaurant});

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
    int id = widget.restaurant.idRestaurant;
    List<MenuItem> menu = [];
    List<String> types = [];

    switch(id){
      case 1: // Costela
        menu = [
          MenuItem(1, "Picanha", 10.00, "Pratos Principais", "Picanha no espeto"),
          MenuItem(2, "Costela", 20.00, "Pratos Principais", "Costela no bafo"),
          MenuItem(3, "Feijoada", 30.00, "Pratos Principais", "Feijoada com linguiça e carne seca"),
          MenuItem(4, "Cola-cola", 20.00, "Bebidas", "Cola-cola de 2 litros"),
          MenuItem(5, "Água", 20.00, "Bebidas", "Água natural mineral de meio litro"),
          MenuItem(6, "Skol", 10.00, "Bebidas", "Skol gelada de 1 litro"),
          MenuItem(7, "Arroz", 20.00, "Acompanhamento", "Arroz branco soltinho"),
          MenuItem(8, "Farofa", 30.00, "Acompanhamento", "Farofa de bacon bem temperada"),
        ];
        types = ["Pratos Principais", "Bebidas", "Acompanhamento"];
        break;

      case 2: // Iwata
        menu = [
          MenuItem(1, "Temaki", 10.00, "Pratos Principais", "Cone com arroz e salmão grelhado"),
          MenuItem(2, "Joe", 20.00, "Pratos Principais", "Joe com salmão e cream cheese"),
          MenuItem(3, "Gourlami", 30.00, "Pratos Principais", "Gourlami com cream cheese e cebolinha"),
          MenuItem(5, "Cola-cola", 20.00, "Bebidas", "Cola-cola de 2 litros"),
          MenuItem(6, "Água", 20.00, "Bebidas", "Água natural mineral de meio litro"),
          MenuItem(10, "Petit-gateau", 20.00, "Sobremesas", "Bola de sorvete de creme com bolinho de chocolate"),
          MenuItem(11, "Creme-brulee", 30.00, "Sobremesas", "Creme Brulee cremoso"),
        ];
        types = ["Pratos Principais", "Bebidas", "Sobremesas"];
        break;

      default: // Genérico
        menu = [
          MenuItem(1, "Comida 1", 10.00, "Comida", "Comida hmm"),
          MenuItem(2, "Comida 2", 20.00, "Comida", "Comida hmm"),
          MenuItem(3, "Comida 3", 30.00, "Comida", "Comida hmm"),
          MenuItem(8, "Bebida 1", 20.00, "Bebida", "Bebida hmm"),
          MenuItem(9, "Bebida 2", 10.00, "Bebida", "Bebida hmm"),
          MenuItem(10, "Acompanhamento 1", 20.00, "Acompanhamento", "Acompanhamento hmm"),
          MenuItem(11, "Acompanhamento 2", 30.00, "Acompanhamento", "Acompanhamento hmm"),
        ];
        types = ['Comida', 'Bebida', 'Acompanhamento'];
        break;
    }

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
                      widget.restaurant.backgroundPictureUrl,
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
                          widget.restaurant.name,
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
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
                              onPressed: () => {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Localização copiada.'),
                                    )
                                )
                              },
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
                              onPressed: () => {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Restaurante favoritado.'),
                                    )
                                )
                              },
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
                          SizedBox(width: 70, child: smallInfoContainer(Icons.star, widget.restaurant.rating.toString())),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                          widget.restaurant.description,
                        textScaleFactor: 1.1,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Reservation()),
                          );
                        },
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
                child: listMenu(menu, controller)
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
