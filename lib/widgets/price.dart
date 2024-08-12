import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Price extends StatelessWidget{
  const Price({required this.currentPrice,required this.previousPrice,super.key});
  final String currentPrice;
  final String previousPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
    Text(
    currentPrice,
    style: GoogleFonts.jost(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    ),
    ),
    const SizedBox(
    width: 20,
    ),
    Text(previousPrice,
    style: const TextStyle(
    fontSize: 20,
    color: Colors.grey,
    decoration: TextDecoration.lineThrough,
    ))
    ],
    );
  }

}