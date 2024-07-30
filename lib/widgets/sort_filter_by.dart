import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SortFilterBy extends StatelessWidget {
  const SortFilterBy({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.sort_rounded, color: Colors.black),
            const SizedBox(width: 6),
            Text(
              'Sort by',
              style: GoogleFonts.jost(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 6),
            const Text('|'),
            const SizedBox(width: 6),
            const Icon(Icons.filter_alt_outlined),
            Text(
              'Filter by',
              style: GoogleFonts.jost(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
