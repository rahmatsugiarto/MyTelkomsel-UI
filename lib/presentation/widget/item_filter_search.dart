// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_telkomsel_ui/resources/assets.gen.dart';

import '../../resources/colors.gen.dart';

class ItemFilterSearch extends StatelessWidget {
  final List<String> listData;
  final double height;
  final int indexSelected;
  final Function(int) onTap;
  bool isMasaAktif;
  ItemFilterSearch({
    Key? key,
    required this.listData,
    required this.height,
    required this.indexSelected,
    required this.onTap,
    this.isMasaAktif = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          final data = listData[index];
          return GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: indexSelected == index
                    ? ColorName.primaryColor.withAlpha(50)
                    : ColorName.greyDivider,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Center(
                child: isMasaAktif
                    ? Row(
                        children: [
                          SvgPicture.asset(
                            Assets.images_timer_sand.path,
                            color: indexSelected == index
                                ? ColorName.primaryColor
                                : ColorName.textColor,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            data,
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: indexSelected == index
                                  ? ColorName.primaryColor
                                  : ColorName.textColor,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        data,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: indexSelected == index
                              ? ColorName.primaryColor
                              : ColorName.textColor,
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
