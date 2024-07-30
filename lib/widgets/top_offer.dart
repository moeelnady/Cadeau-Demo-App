import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopOffer extends StatelessWidget{
  const TopOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.percent_outlined,
              color: Colors.deepOrange,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Text('Top offers for Birthday',
                    style: GoogleFonts.jost(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(
                  width: 250,
                  child: Text(
                    'Discover top offers for birthday’s gift and save money',style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400, fontSize: 15),),)
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }


}