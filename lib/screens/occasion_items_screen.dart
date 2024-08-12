import 'package:cadeau_app/widgets/occasion_item_card.dart';
import 'package:cadeau_app/widgets/sort_filter_by.dart';
import 'package:cadeau_app/widgets/top_offer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OccasionItemsScreen extends StatelessWidget {
  const OccasionItemsScreen(this.productsList,{super.key});
  final List<Map<String,dynamic>> productsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Occasion name',
              style: GoogleFonts.jost(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                icon: const Icon(Icons.search),
                iconSize: 35,
                tooltip: 'Search for item',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Search for your item'),
                    duration: Duration(seconds: 1),
                  ));
                }),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                const TopOffer(),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 images per row
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                          childAspectRatio: 0.7),
                      itemCount: productsList.length,
                      itemBuilder: (ctx, index) {
                        return OccasionItemCard(productsList,index);
                      }),
                ),
              ],
            ),
            const Positioned(
              top: 670.0,
              left: 100,
              right: 100.0,
              bottom: 0,
              child: SortFilterBy(),
            ),
          ],
        ),
      ),
    );
  }
}
