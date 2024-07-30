import 'package:cadeau_app/models/occasion_item.dart';
import 'package:cadeau_app/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OccasionItemCard extends StatelessWidget {
  const OccasionItemCard(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> const ProductDetailsScreen())
              );
            },
            child: occasionItems[index].image,
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
              width: 150,
              child: Text(
                occasionItems[index].description,
                style:
                    GoogleFonts.jost(fontWeight: FontWeight.w400, fontSize: 20),
              )),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Text(
                  occasionItems[index].currentPrice,
                  style: GoogleFonts.jost(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(occasionItems[index].previousPrice,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
