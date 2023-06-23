import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../../models/menu_item.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

Widget menuTile(String name, String description, String price) {
  return ListTile(
    title: Text(name),
    subtitle: Text(description),
    trailing: Text("R\$ $price"),
  );
}

Widget listMenu(List<MenuItem> items, ScrollController controller) {
  items.sort((a, b) => a.itemType.compareTo(b.itemType));
  final groupedItems = groupBy(items, (obj) => obj.itemType);
  final br_currency = NumberFormat("#,##0.00", "pt_BR");

  return CustomScrollView(
      controller: controller,
      slivers: groupedItems.entries.map((entry) {
    final itemType = entry.key;
    final items = entry.value;

    return MultiSliver(children: [
      SliverPinnedHeader(
          child: ColoredBox(
        color: Colors.white,
        child: ListTile(
          title: Text(
            itemType,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      )),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = items[index];
          return menuTile(item.name, item.description, br_currency.format(item.price));
        },
        childCount: items.length,
      )),
    ]);
  }).toList());
}
