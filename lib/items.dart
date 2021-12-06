//item class
class Items {
  String? itemID;
  String? itemName;
  String? img;
  String? description;

  Items({
    this.itemID,
    this.itemName,
    this.img,
    this.description,
  });
}

//category list
class Category {
  static List<Items> categories = <Items>[
    Items(
      itemID: 'id_1',
      itemName: 'burger',
      img: 'assets/burger.jpg',
      description: 'This is a burger',
    ),
    Items(
      itemID: 'id_2',
      itemName: 'pasta',
      img: 'assets/pasta.jpg',
      description: 'This is a pasta',
    ),
    Items(
      itemID: 'id_3',
      itemName: 'pizza',
      img: 'assets/pizza.jpg',
      description: 'This is a pizza',
    ),
    Items(
      itemID: 'id_4',
      itemName: 'fried chicken',
      img: 'assets/fried_chicken.jpg',
      description: 'This is a fried chicken',
    ),
  ];
}
