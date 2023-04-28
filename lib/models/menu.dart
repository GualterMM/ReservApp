import 'menu_item.dart';

class Menu {
  final int idMenu;
  final List<MenuItem> menuItemList;

  Menu(this.idMenu, this.menuItemList);


  // TODO: Verificar a possibilidade da API retornar o cardapio já com os itens, ao invés da relação
  Menu.fromJson(Map<String, dynamic> json):
      idMenu = json['idCardapio'],
      menuItemList = json['cardapio'];

  Map<dynamic, dynamic> toJson() {
    List items = [];

    for(final element in menuItemList){
      Map item = element.toJson();
      items.add(item);
    }

    Map jsonObject = {"cardapio" : items};
    return jsonObject;
  }
}