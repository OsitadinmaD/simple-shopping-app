import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping_app/screen/cart_provider.dart';
import 'package:simple_shopping_app/screen/check_out_screen.dart';
import 'package:simple_shopping_app/widget/item_display.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});
  

  
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, index) => Scaffold(
        
        body: SafeArea(
                  child: Column(
                    children:[ 
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 15 , right: 15),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent,
                          child: ListView.separated(
                            separatorBuilder: (context, _) => const SizedBox(width: 5,),
                            scrollDirection: Axis.vertical,
                            itemCount: provider.cartItems.length,
                            itemBuilder: (context,index) {
                              return ItemDisplay(
                                item: provider.cartItems[index],
                                route: () => provider.removeItem(index),
                              );
                            },
                          ),
                        ),
                      ),
                const SizedBox(height: 20,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
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
                         style:  const TextStyle(
                           fontSize: 12,
                           fontWeight: FontWeight.w500,
                           color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                   ),
                   const SizedBox(width: 20,),
                    InkWell(
                    onTap: () => provider.clearCart(),
                     child: Container(
                     height: 40,
                     width: 120,
                     decoration: BoxDecoration(
                       color: Colors.blueGrey.shade400,
                       border: Border.all(style: BorderStyle.solid,color: Colors.black),
                       borderRadius: BorderRadius.circular(25),
                     ),
                     child: const Center(
                       child: Text(
                         'Clear',
                         style: TextStyle(
                           fontSize: 12,
                           fontWeight: FontWeight.w500,
                           color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                   ),
                  ]
                 ),
                const SizedBox(height: 20,)
                ]
              ),
            )
      ),
    );
         }
        }