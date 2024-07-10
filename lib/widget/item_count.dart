import 'package:flutter/material.dart';

class ItemCount extends StatefulWidget {
  const ItemCount({super.key,required this.price , required this.totalPrice});

  final double price;
  final double totalPrice;

  static int quantity = 6;

  


  @override
  State<ItemCount> createState() => _ItemCountState();
}

class _ItemCountState extends State<ItemCount> {
  late double _price;
  late double _totalPrice;
  static int  _count = 1;
  @override
  void initState(){
    super.initState();
    _price = widget.price;
    _totalPrice = widget.totalPrice;
    ItemCount.quantity = _count;
  } 

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () => _decrementButton(),
                  icon: const Icon(Icons.remove,color: Colors.black, size: 15,)
                ),
                Text(
                  '$_count',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                    ), 
                ),
                IconButton(
                  onPressed: () => _incrementButton(),
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
            '\$$_totalPrice',
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

  void _incrementButton(){
    setState(() {
      _count += 1;
      _totalPrice += _price;
      ItemCount.quantity += 1;
    });
  }
  
  void _decrementButton(){
    setState(() {
      if(_count != 0){
      _count -= 1;
      _totalPrice -= _price;
      ItemCount.quantity -= 1;
      }
    });

  }

}