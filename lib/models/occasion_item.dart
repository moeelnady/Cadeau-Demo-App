import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OccasionItem{
  OccasionItem(
      this.image, this.description, this.currentPrice, this.previousPrice);
  final Image image;
  final String description;
  final String currentPrice;
  final String previousPrice;
}
List<OccasionItem> occasionItems =[
  OccasionItem(Image.asset('lib/assets/flower_1.png'), 'Yellow hoddies for Summer', 'SAR 380', 'SAR 380'),
  OccasionItem(Image.asset('lib/assets/flower_2.png'), 'Yellow hoddies for Summer', 'SAR 380', 'SAR 380'),
  OccasionItem(Image.asset('lib/assets/flower_3.png'), 'Yellow hoddies for Summer', 'SAR 380', 'SAR 380'),
  OccasionItem(Image.asset('lib/assets/flower_4.png'), 'Yellow hoddies for Summer', 'SAR 380', 'SAR 380'),
  OccasionItem(Image.asset('lib/assets/flower_5.png'), 'Yellow hoddies for Summer', 'SAR 380', 'SAR 380'),
  OccasionItem(Image.asset('lib/assets/flower_6.png'), 'Yellow hoddies for Summer', 'SAR 380', 'SAR 380'),



];