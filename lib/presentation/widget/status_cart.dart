import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/colors.gen.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final String data;
  final String satuan;
  const StatusCard({
    Key? key,
    required this.title,
    required this.data,
    required this.satuan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 110,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.openSans(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: ColorName.textColor,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: data,
                  style: GoogleFonts.openSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorName.primaryColor,
                  ),
                  children: [
                    TextSpan(
                      text: " $satuan",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorName.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
