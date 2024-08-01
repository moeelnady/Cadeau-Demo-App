import 'package:cadeau_app/widgets/add_to_cart.dart';
import 'package:cadeau_app/widgets/price.dart';
import 'package:cadeau_app/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var imagePath = 'lib/assets/product-1.png';
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [

                Column(
                  children: [
                    Image.asset(
                      imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // First rectangle (orange)
                        Container(
                          width: 30,
                          height: 5,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 5),
                        // Rest of the rectangles (grey)
                        for (int i = 0; i < 4; i++)
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 5,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'More from',
                                style: GoogleFonts.jost(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Zara",
                                style: GoogleFonts.jost(
                                    fontSize: 20,
                                    color: const Color.fromARGB(255, 63, 170, 174),
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                    const Color.fromARGB(255, 63, 170, 174)),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Yellow hoodies for Summer',
                              style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 25),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const RatingWidget(4),
                          const SizedBox(height: 10),
                          const Price(
                              currentPrice: 'SAR 230', previousPrice: 'SAR 220')
                        ],
                      ),
                    ),
                    const Divider(
                      height: 20,
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                      color: Color.fromARGB(255, 236, 236, 236),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Description',
                          style: GoogleFonts.jost(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 25),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularise in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularise in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                          style: GoogleFonts.jost(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  leading: Center(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.share_outlined, color: Colors.black),
                      onPressed: () {
                        // Handle favorite action
                      },
                    ),
                  ],
                ),
              ],
            ),

          ),

          const Positioned(
            top: 700.0,
            left: 20.0,
            bottom: 0,
            child: AddToCart('SAR 2228', 'Add To Cart'),
          ),
        ],
      ),
    );
  }
}
