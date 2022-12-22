import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/colors.gen.dart';

class ItemCategory extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  const ItemCategory({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            image,
            height: 53,
            width: 53,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: ColorName.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
