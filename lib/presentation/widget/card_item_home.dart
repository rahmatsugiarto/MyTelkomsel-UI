import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/colors.gen.dart';

class CardItemHome extends StatelessWidget {
  final String image;
  final String title;
  final double widthCard;
  final double heightImage;
  const CardItemHome({
    Key? key,
    required this.image,
    required this.title,
    required this.widthCard,
    required this.heightImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          elevation: 5,
          child: SizedBox(
            width: widthCard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  height: heightImage,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorName.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8.0),
      ],
    );
  }
}
