import 'package:flutter/material.dart';

class AppColors {
  static const Color beige = Color(0xFFA8A878);
  static const Color black = Color(0xFF303943);
  static const Color blue = Color(0xFF429BED);
  static const Color brown = Color(0xFFB1736C);
  static const Color darkBrown = Color(0xD0795548);
  static const Color darkGrey = Color(0xFF303943);
  static const Color grey = Color(0x64303943);
  static const Color indigo = Color(0xFF6C79DB);
  static const Color lightBlue = Color(0xFF7AC7FF);
  static const Color lightBrown = Color(0xFFCA8179);
  static const Color whiteGrey = Color(0xFFFDFDFD);
  static const Color lightCyan = Color(0xFF98D8D8);
  static const Color lightGreen = Color(0xFF78C850);
  static const Color lighterGrey = Color(0xFFF4F5F4);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color lightPink = Color(0xFFEE99AC);
  static const Color lightPurple = Color(0xFF9F5BBA);
  static const Color lightRed = Color(0xFFFB6C6C);
  static const Color lightTeal = Color(0xFF48D0B0);
  static const Color lightYellow = Color(0xFFFFCE4B);
  static const Color lilac = Color(0xFFA890F0);
  static const Color pink = Color(0xFFF85888);
  static const Color purple = Color(0xFF7C538C);
  static const Color red = Color(0xFFFA6555);
  static const Color teal = Color(0xFF4FC1A6);
  static const Color yellow = Color(0xFFF6C747);
  static const Color semiGrey = Color(0xFFbababa);
  static const Color violet = Color(0xD07038F8);

  // pokemon colors
  static const kBug = Color(0xFFA6B91A);
  static const kDark = Color(0xFF705746);
  static const kDragon = Color(0xFF6F35FC);
  static const kElectric = Color(0xFFF7D02C);
  static const kFairy = Color(0xFFD685AD);
  static const kFighting = Color(0xFFC22E28);
  static const kFire = Color(0xFFEE8130);
  static const kFlying = Color(0xFFA98FF3);
  static const kGhost = Color(0xFF735797);
  static const kGrass = Color(0xFF7AC74C);
  static const kGround = Color(0xFFE2BF65);
  static const kIce = Color(0xFF96D9D6);
  static const kNormal = Color(0xFFA8A77A);
  static const kPoison = Color(0xFFA33EA1);
  static const kPsychic = Color(0xFFF95587);
  static const kRock = Color(0xFFB6A136);
  static const kSteel = Color(0xFFB7B7CE);
  static const kWater = Color(0xFF6390F0);


  static const typeColorMap = {
    'Bug': kBug,
    'Dark': kDark,
    'Dragon': kDragon,
    'Electric': kElectric,
    'Fairy': kFairy,
    'Fighting': kFighting,
    'Fire': kFire,
    'Flying': kFlying,
    'Ghost': kGhost,
    'Grass': kGrass,
    'Ground': kGround,
    'Ice': kIce,
    'Normal': kNormal,
    'Poison': kPoison,
    'Psychic': kPsychic,
    'Rock': kRock,
    'Steel': kSteel,
    'Water': kWater,
  };
  
  Color getTypeColor(String type) {
    return typeColorMap[type] ?? Colors.transparent;
  }
}