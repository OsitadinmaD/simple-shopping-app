import 'package:flutter/material.dart';
import 'package:simple_shopping_app/help_classes/item_list.dart';
import 'package:simple_shopping_app/widget/box_display_widget.dart';
import 'package:simple_shopping_app/widget/items_display_view.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  

  
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 10,),
              const BoxDisplayView(),
              const SizedBox(height: 10,),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Positioned(
                      top: 5.0,
                      left: 26.0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 40.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.grey.shade800,
                        ),
                        child: const Text(
                          'Men\'s Wear',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ]
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                height: 260,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(width: 20,),
                  scrollDirection: Axis.horizontal,
                  itemCount: product.length,
                  itemBuilder: (context,index){
                    if(index < 6){
                      return ItemsDisplayView(
                       item: product[index]
                      );
                    }else{
                      return null;
                    }
                  }
                )
              ),
              const SizedBox(width: 10),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Positioned(
                      top: 5.0,
                      left: 26.0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 40.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.grey.shade800,
                        ),
                        child: const Text(
                          'Shoes',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ]
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                height: 260,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(width: 20,),
                  scrollDirection: Axis.horizontal,
                  itemCount: product.length-13,
                  itemBuilder: (context,index){ 
                    return ItemsDisplayView(
                      item: product[index+6]
                  );
                  }
                  
                )
              ),

            ],
            
          ),
        )
      )
    );
  }
}