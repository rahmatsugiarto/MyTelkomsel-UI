import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/colors.gen.dart';

class ItemBottomNav extends StatelessWidget {
  final String image;
  final String label;
  final bool active;
  final double heightSpace;

  const ItemBottomNav({
    Key? key,
    required this.image,
    required this.label,
    required this.active,
    this.heightSpace = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        splashColor: ColorName.greyDivider,
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
            ),
            SizedBox(height: heightSpace),
            Text(
              label,
              style: GoogleFonts.openSans(
                fontSize: 10,
                fontWeight: active ? FontWeight.bold : FontWeight.w500,
                color: active ? ColorName.primaryColor : ColorName.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
