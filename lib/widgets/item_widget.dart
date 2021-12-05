import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({required this.item, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SwitchTile ExpensionTile
    return Card(
      // shape: const StadiumBorder(),
      child: ListTile(

        onTap: () {
          
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}