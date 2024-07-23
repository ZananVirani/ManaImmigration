import 'package:Melofy/core/app_export.dart';
import 'package:flutter/material.dart';

class GenreImage {
  late Container container;

  GenreImage(BuildContext context, String path) {
    container = Container(
        width: MediaQuery.sizeOf(context).width * 0.2,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: 0.5, strokeAlign: BorderSide.strokeAlignOutside)),
        child: CustomImageView(
            imagePath: 'assets/images/genre_$path', fit: BoxFit.cover));
  }
}
