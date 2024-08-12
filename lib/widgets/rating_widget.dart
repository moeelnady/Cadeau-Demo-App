import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget{
  const RatingWidget(this.rating,{super.key});
  final rating;

  @override
  Widget build(BuildContext context) {
   return Align(
     alignment: Alignment.centerLeft,
     child: Row(
       mainAxisSize: MainAxisSize.min,
       children: List.generate(5, (index) {
         if (index < rating) {
           return const Icon(
             Icons.star,
             color: Colors.amber,
             size: 20.0,
           );
         } else {
           return const Icon(
             Icons.star_border,
             color: Colors.amber,
             size: 20.0,
           );
         }
       }),
     ),
   );
  }

}