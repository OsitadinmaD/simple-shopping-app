import 'package:flutter/material.dart';
import 'package:simple_shopping_app/help_classes/items_model.dart';
import 'package:simple_shopping_app/widget/item_count.dart';


class ItemDisplay extends StatelessWidget {
  const ItemDisplay(
    {
      super.key, 
      required this.item,
      required this.route,
    }
  );
  
  final Items item;
  final  Function()? route;


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(bottom: 5,top: 5),
      height: 160,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(25),
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    colors: [Colors.white,Colors.black45], 
                    begin: Alignment.topCenter, 
                    end: Alignment.bottomCenter
                  ), 
                ),
                child: Container(
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: item.image , fit: BoxFit.cover),
                   ),
                ),
              ),
            ),
            Positioned(
              top: 13,
              left: 120,
              child: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 120,
              child: ItemCount(price: item.price,totalPrice: item.price,),
            ),
            Positioned(
              top: 2,
              left: 270,
              child: IconButton(
                onPressed: route,
                icon: const Icon(Icons.close, color: Colors.black,)
              )
            )
          ],
        ),
      ),
    );
  }
}