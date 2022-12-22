import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/colors.gen.dart';

class ItemRincianPaket extends StatelessWidget {
  final String title;
  final String detail;
  final bool zeroMargin;
  const ItemRincianPaket({
    Key? key,
    required this.title,
    required this.detail,
    this.zeroMargin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: zeroMargin ? EdgeInsets.zero : const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ColorName.textColor,
            ),
          ),
          Text(
            detail,
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ColorName.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
