import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_telkomsel_ui/resources/assets.gen.dart';

import '../../resources/colors.gen.dart';

class ItemSortFilter extends StatelessWidget {
  final String title;
  final bool isChecked;
  final VoidCallback onTap;
  const ItemSortFilter({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorName.textColor,
                  ),
                ),
                isChecked
                    ? SvgPicture.asset(Assets.images_round_check.path)
                    : const SizedBox(),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
