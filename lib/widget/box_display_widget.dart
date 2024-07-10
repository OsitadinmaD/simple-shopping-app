import 'package:flutter/material.dart';

class BoxDisplayView extends StatelessWidget {
  const BoxDisplayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25,right: 25,bottom: 0),
      height: 155,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Stack(
        children: [
          Card(
            elevation: 8.0,
            shadowColor: const Color.fromARGB(218, 248, 137, 33),
            borderOnForeground: true,
            child: Container(
              height: 150,
              width: 280,
              decoration:  BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color.fromARGB(220, 226, 208, 48),Color.fromARGB(218, 248, 137, 33)], 
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 151,
            child: Container(
              height: 100,
              width: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/mens_shoes/shoe 1.png',), 
                  fit: BoxFit.cover,
                ),
              ),
            )
          ),
          const Positioned(
            top: 50,
            left: 20,
            child: Text(
              'NEW LIMITED\nEDITION',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ), 
          ),
          const Positioned(
            top: 20,
            left: 20,
            child: Text(
              'PixSlide',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2,
              ),
            ), 
          )
        ]
      ),
    );
  }
}