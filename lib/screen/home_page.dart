import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping_app/screen/cart_provider.dart';
import 'package:simple_shopping_app/screen/check_out.dart';
import 'package:simple_shopping_app/screen/product_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int _currentIndex = 0;
 final List _pagesList = [];
 late Widget _currentPage;
  @override
  Widget build(BuildContext context) {
    
  final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 10,
          width: 10,
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            image: const DecorationImage(image: AssetImage('assets/profile_pix/divine.jpg'),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        title: RichText(
          text: const TextSpan(
            children: [
               TextSpan(
                text: 'Pix',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                )
               ),
               TextSpan(
                text: 'Slide',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                )
               )
            ]
          )
        ),
        centerTitle: true,
        actions: [
          
         Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //const SizedBox(width: 1,),
            const Icon(Icons.shopping_cart_rounded,color: Colors.black, size: 30,),
            Text(
              '${provider.cartItems.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                backgroundColor: Colors.black87,
              ),
            ),
          ]
         ),
         const SizedBox(width: 73,)
        ]
      ),
         
      
      body:  _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket,size: 20,),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline,size: 20,),
            label: 'Checkout',
          ),
        ],
        onTap: (index) => _changePage(index),
      )
    );
  }
  void _changePage(int index){
    setState(() {
      _currentIndex = index;
      _currentPage = _pagesList[index];
    });
  }
  @override
 void initState(){
   super.initState();

   _pagesList..add(const ProductScreen())..add(const CheckOutPage());
   _currentPage = const ProductScreen();
 }
}