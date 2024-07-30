import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Occasion {
  const Occasion(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.iconImage,
      required this.image});
  final int id;
  final String title;
  final String subtitle;
  final Image iconImage;
  final Image image;
}

List<Occasion> occasionsList = [
  Occasion(
      id: 1,
      title: 'BIRTHDAY GIFT',
      subtitle: 'Nam facilisis risus leo, vitae tempus nisl.',
      iconImage: Image.asset('lib/assets/cake.png',),
      image: Image.asset('lib/assets/birthday.png')),
  Occasion(
      id: 2,
      title: 'VALENTINE\'S DAY',
      subtitle: 'Nam facilisis risus leo, vitae tempus nisl.',
      iconImage:Image.asset('lib/assets/lovely.png'),
      image: Image.asset('lib/assets/valentine.png')),
  Occasion(
      id: 3,
      title: 'Anniversary',
      subtitle: 'Nam facilisis risus leo, vitae tempus nisl.',
      iconImage:Image.asset('lib/assets/lovely.png'),
      image: Image.asset('lib/assets/anniversary.png'))
];
