import 'package:flutter/material.dart';
import 'package:flutter_video/cart.dart';
import 'package:flutter_video/demoModel.dart';
import 'package:flutter_video/items.dart';
import 'package:provider/provider.dart';

class Demo extends StatefulWidget {
  Demo({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ShoppingCart(
                                items: context.read<DemoModel>().list)));
                  },
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    size: 40,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 10,
                  child: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    //display total items added
                    child: Text(
                      '${context.watch<DemoModel>().count}',
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      //items display
      body: GridView.count(
        childAspectRatio: 0.75,
        crossAxisCount: 2,
        children: List.generate(Category.categories.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Column(
                children: <Widget>[
                  Stack(children: [
                    Image.asset(
                      Category.categories[index].img!,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text(
                        Category.categories[index].itemName!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Add to Cart'),
                        //comsumer here to trigger actions when button pressed
                        Consumer<DemoModel>(
                            builder: (context, demoModel, child) {
                          return IconButton(
                            icon: Icon(Icons.shopping_bag_outlined),
                            onPressed: () {
                              setState(() {
                                demoModel.addItems(Category.categories[index]);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      '${Category.categories[index].itemName} added to cart'),
                                ));
                              });
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
