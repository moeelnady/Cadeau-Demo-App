import 'package:cadeau_app/controllers/occasion_controller.dart';
import 'package:cadeau_app/controllers/products_controller.dart';
import 'package:cadeau_app/models/occasion.dart';
import 'package:cadeau_app/screens/occasion_items_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OccasionCard extends StatelessWidget {
  const OccasionCard(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 230,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: Image.network(receivedOccasionsList[index]['banner']).image,
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    occasionsList[0].iconImage,
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        receivedOccasionsList[index]['name'],
                        style: GoogleFonts.jost(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  SizedBox(
                      width: 200,
                      child: Text(
                        receivedOccasionsList[index]['description'],
                        style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400, color: Colors.white,fontSize: 20),
                      )),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 120,
                      child: FilledButton(
                        onPressed: () async{
                          final productsList = await ProductsController().getProductsById(receivedOccasionsList[index]['id']);
                          if(!context.mounted){
                            return ;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return OccasionItemsScreen(productsList);
                                }),
                          );
                        },
                        style: FilledButton.styleFrom(
                            backgroundColor: Colors.orange.shade900,
                            foregroundColor: Colors.white,
                            textStyle:
                                GoogleFonts.jost(fontWeight: FontWeight.w400,fontSize: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0), // rounded corners
                          ),
                        ),
                        child: const Text('View'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
