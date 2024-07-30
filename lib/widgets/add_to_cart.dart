import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCart extends StatelessWidget{
  const AddToCart(this.text1,this.text2,{super.key});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 150,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 0.5),
            ),
 // First rectangle color
            child: Center(
              child: Text(
                text1,
                style: GoogleFonts.jost(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15
                )
              ),
            ),
          ),
          const SizedBox(width: 3),
          Container(
            width: 200,
            height: 70,
            color:const Color.fromARGB(255, 63, 170, 174),
            child: Center(
              child: Text(
                text2,
                style: GoogleFonts.jost(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17

              ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}