import 'package:cadeau_app/widgets/occasion_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/occasion.dart';

class OccasionScreen extends StatelessWidget {
  const OccasionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings route){
        return MaterialPageRoute(builder: (context)=>  Scaffold(
          appBar: AppBar(
            title: Text(
              'Occasions',
              style: GoogleFonts.jost(
                  color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                    icon: const Icon(Icons.notifications_none_outlined),
                    iconSize: 35,
                    tooltip: 'Show notification',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('This is a notification'),
                        duration: Duration(seconds: 1),
                      ));
                    }),
              )
            ],
          ),
          body: ListView.builder(
              itemCount: occasionsList.length,
              itemBuilder: (context, index) => OccasionCard(index)
          ),
        ),);
      },
    );
  }
}
