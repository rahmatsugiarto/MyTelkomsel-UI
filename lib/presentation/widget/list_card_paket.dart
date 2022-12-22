import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../dummy/data_dummy.dart';
import '../../resources/assets.gen.dart';
import '../../resources/colors.gen.dart';

class ListCardPaket extends StatelessWidget {
  final List<PaketModel> dataPaket;
  const ListCardPaket({
    Key? key,
    required this.dataPaket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: dataPaket.length,
        padding: const EdgeInsets.only(left: 20, right: 10),
        itemBuilder: (BuildContext context, int index) {
          final data = dataPaket[index];
          return Container(
            width: 248,
            margin: const EdgeInsets.only(right: 8),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.kuota,
                          style: GoogleFonts.openSans(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: ColorName.textColor,
                          ),
                        ),
                        Container(
                          height: 28,
                          width: 83,
                          decoration: const BoxDecoration(
                            color: ColorName.graySearch,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.images_timer_sand.path,
                              ),
                              const SizedBox(width: 5.0),
                              Text(
                                data.kuota,
                                style: GoogleFonts.openSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: ColorName.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.images_bookmark_fill.path,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        data.hargaPromo.isNotEmpty
                            ? Text(
                                data.hargaNormal,
                                style: GoogleFonts.openSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorName.textColor,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              )
                            : const SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.hargaPromo.isNotEmpty
                                  ? data.hargaPromo
                                  : data.hargaNormal,
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ColorName.primaryColor,
                              ),
                            ),
                            Text(
                              data.namaPaket,
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ColorName.textColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
