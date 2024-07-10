import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping_app/screen/cart_provider.dart';
import 'package:simple_shopping_app/screen/check_out_screen.dart';
import 'package:simple_shopping_app/widget/item_display.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartProvider>(
        builder: (BuildContext context, provider, Widget? child) { 
         if(provider.cartItems.isEmpty){
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.remove_shopping_cart_rounded,size: 50, color: Colors.blueGrey,),
                SizedBox(height: 10,),
                Text(
                  'Cart is Empty\nPlease select an Item',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
         }else{
          return SafeArea(
                child: Column(
                  children:[ 
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 15 , right: 15),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(width: 5,),
                          scrollDirection: Axis.vertical,
                          itemCount: provider.cartItems.length,
                          itemBuilder: (context,index) {
                            return ItemDisplay(
                              item: provider.cartItems[index],
                              route: (){
                                Provider.of<CartProvider>(context, listen: false).remove(index);
                              },
                            );
                          },
                        ),
                      ),
                    ),
              const SizedBox(height: 20,),
               InkWell(
                onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const OrderSuccessfulScreen() )),
                 child: Container(
                 height: 40,
                 width: 120,
                 decoration: BoxDecoration(
                   color: Colors.blueGrey.shade400,
                   border: Border.all(style: BorderStyle.solid,color: Colors.black),
                   borderRadius: BorderRadius.circular(25),
                 ),
                 child: Center(
                   child: Text(
                     'Checkout \n\$${provider.totalPrice}',
                     style: const TextStyle(
                       fontSize: 12,
                       fontWeight: FontWeight.w500,
                       color: Colors.black,
                       
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,)
              ]
            ),
          );
         }
        }
      ),
    );
  }
}