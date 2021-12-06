import 'package:flutter/material.dart';
import 'package:flutter_video/demoModel.dart';
import 'package:flutter_video/items.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  ShoppingCart({Key? key, required this.items}) : super(key: key);
  final List<Items> items;

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    if (widget.items.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Image.asset(
                  widget.items[index].img!,
                  fit: BoxFit.cover,
                ),
                title: Text(widget.items[index].itemName!),
                subtitle: Text(widget.items[index].description!),
                trailing: Consumer<DemoModel>(
                  builder: (context, demoModel, child) {
                    return IconButton(
                      icon: Icon(Icons.delete_forever),
                      onPressed: () {
                        setState(() {
                          demoModel.removeItem(widget.items[index]);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                '${Category.categories[index].itemName} has been deleted'),
                          ));
                        });
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: Center(
          child: Text('No Item added!'),
        ),
      );
    }
  }
}
