import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping_app/help_classes/items_model.dart';
import 'package:simple_shopping_app/screen/cart_provider.dart';

class ItemsDisplayView extends StatelessWidget {
  const ItemsDisplayView({
    super.key,
    required this.item
    }
  );

  final Items item;

  
  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<CartProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.only(right: 10),
      height: 250,
      width: 180,
      decoration: BoxDecoration(
        //color: Colors.brown,
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [Colors.white,Colors.black45], 
          begin: Alignment.topCenter, 
          end: Alignment.bottomCenter
        ),
      ),
      child: Container(
        height: 250,
        width: 180,
        decoration: BoxDecoration(
          image: DecorationImage(image: item.image ,fit: BoxFit.cover)
        ),
        child: Stack(
          children: [
            Positioned(
              top: 185,
              left: 12,
              child: Container(
                height: 50,
                width: 155,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)
                ),
              )
            ),
            Positioned(
              top: 192,
              left: 18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    item.name ,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2,),
                  Text(
                    '\$${item.price}',
                     style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
            ),
            Positioned(
              top: 190,
              left: 120,
              child: InkWell(
                  onTap: () => provider.addItem(item),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                        ),
                    )
                  )
              )
            )
          ],
        ),
      ),
    );

  }
}