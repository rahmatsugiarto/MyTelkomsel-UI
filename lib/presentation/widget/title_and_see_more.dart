import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/colors.gen.dart';

class TitleAndSeeMore extends StatelessWidget {
  final bool seeMore;
  final String title;
  const TitleAndSeeMore({
    Key? key,
    required this.seeMore,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return seeMore
        ? Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorName.textColor,
                  ),
                ),
                Text(
                  "Lihat Semua",
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorName.primaryColor,
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorName.textColor,
              ),
            ),
          );
  }
}
