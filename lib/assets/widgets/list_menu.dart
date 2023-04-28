import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../../models/menu_item.dart';

class Section extends MultiSliver {
  Section({
    Key? key,
    required String title,
    required List<Widget> items,
  }) : super(
          key: key,
          pushPinnedChildren: true,
          children: [
            SliverPinnedHeader(
                child: ColoredBox(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            )),
            SliverList(delegate: SliverChildListDelegate.fixed(items)),
          ],
        );
}

List<MenuItem> filterList(List<MenuItem> menuItems, String filter) {
  return menuItems.where((element) => element.itemType == filter).toList();
}

Widget menuTile(String name, String description, double price) {
  return ListTile(
    title: Text(name),
    subtitle: Text(description),
    trailing: Text("R\$ $price"),
  );
}

Widget listMenu(List<MenuItem> menuItems, List<String> itemTypes,
    ScrollController controller) {
  List<Widget> menuList = [];
  List<Widget> sliverList = [
    const SliverPinnedHeader(
        child: ColoredBox(
          color: Colors.white,
          child: ListTile(
            title: Text(
              "Cardápio",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        )),
  ];
  for (var element in itemTypes) {
    filterList(menuItems, element).forEach((e) {
      menuList.add(menuTile(e.name, e.description, e.price));
    });

    sliverList.add(Section(title: element, items: menuList));

    menuList = [];
  }

  return CustomScrollView(
    controller: controller,
    slivers: sliverList,
  );
}
