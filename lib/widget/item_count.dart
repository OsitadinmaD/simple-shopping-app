import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping_app/help_classes/items_model.dart';
import 'package:simple_shopping_app/screen/cart_provider.dart';

class ItemCount extends StatelessWidget {
  const ItemCount({super.key, required this.item});

  final Items item;
  
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return  Container(
      height: 40,
      width: 250,
      color: Colors.transparent,
      child: Stack(
        children: [ 
          Positioned(
          top: 5,
          left: 5,
          child: Container(
            height: 30,
            width: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,),
              //color: Colors.amber
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => provider.decrementQuantity(item: item),
                  icon: const Icon(Icons.remove,color: Colors.black, size: 15,)
                ),
                Text(
                  '${provider.totalQuantity}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                    ), 
                ),
                IconButton(
                  onPressed: () => provider.incrementQuantity(item: item),
                  icon: const Icon(Icons.add,color: Colors.black, size: 15,)
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 9,
          left: 130,
          child: Text(
            '\$${provider.itemTotalPrice}',
            style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            ), 
          )
          )
        ]
      ),
    );
  }

}