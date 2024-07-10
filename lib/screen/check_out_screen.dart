import 'package:flutter/material.dart';

class OrderSuccessfulScreen extends StatelessWidget {
  const OrderSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        icon: const Icon(Icons.arrow_back,color: Colors.black,size: 30,)
                      ),
                      const SizedBox(width: 100,),
                      const Icon(Icons.shopping_cart,color: Colors.black,size: 50,),
                      const SizedBox(width: 60,),
                     
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Congrats! You\'ll get free standard shipping',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                        ),
                      ),
                      SizedBox(width: 5,),
                      Icon(
                        Icons.handshake,
                        size: 15,
                        color: Colors.black, 
                      )
                    ]
                  )
                ],
              ),
            ),
            const Divider(color: Colors.black,height: 10,thickness: 4,), 
            const SizedBox(height:150),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Order',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                  TextSpan(
                    text: 'SUCCESSFUL',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ]
              ),
            ),
            const SizedBox(height: 20,),
            const Icon(Icons.shopping_cart_checkout_rounded, size: 80, color: Colors.black,),
            const SizedBox(height: 20,),
            const Text(
              'Thanks for Your Patronage\n~pixslide.com',
               style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
                height: 2,
              ),
               textAlign: TextAlign.center,
            )
          ]
        )
      )
    );
  }
}
