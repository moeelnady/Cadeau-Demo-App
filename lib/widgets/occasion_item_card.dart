import 'package:cadeau_app/controllers/products_controller.dart';
import 'package:cadeau_app/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OccasionItemCard extends StatelessWidget {
  const OccasionItemCard(this.productsList,this.index, {super.key});
  final List<Map<String,dynamic>> productsList;
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

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return  ProductDetailsScreen(productsList[index]);
                  }));
            },
            child: ClipRRect(
              child: AspectRatio(
                aspectRatio: 1, // You can adjust this aspect ratio as needed
                child: Image.network(
                  productsList[index]['thumbnail'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
              width: 150,
              child: Text(
                productsList[index]['name'],
                style:
                    GoogleFonts.jost(fontWeight: FontWeight.w400, fontSize: 20),
              )),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    '${productsList[index]['price_after_discount']} SAR',
                    style: GoogleFonts.jost(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text('${productsList[index]['price']} SAR',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
