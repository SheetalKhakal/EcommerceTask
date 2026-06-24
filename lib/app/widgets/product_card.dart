import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget{
  final String title;
   final double price;
    final String image;

  const ProductCard({super.key, required this.title, required this.price, required this.image});

  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(leading:  Image.network(image, width: 50,),title: Text(title),
      subtitle: Text("\$$price.toString()"),),
    );
  }
}