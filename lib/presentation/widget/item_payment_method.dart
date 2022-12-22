import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resources/colors.gen.dart';

class ItemPaymentMethod extends StatelessWidget {
  final String assetsSvg;
  final String paymentMethod;
  final String saldo;
  final int groupValueRadio;
  final int valueRadio;
  final bool showSaldo;
  Function(int?) onChanged;

  ItemPaymentMethod({
    Key? key,
    required this.assetsSvg,
    required this.paymentMethod,
    this.saldo = "0",
    required this.groupValueRadio,
    required this.valueRadio,
    this.showSaldo = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          SvgPicture.asset(
            assetsSvg,
            width: 24,
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                paymentMethod,
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: ColorName.textColor,
                ),
              ),
              showSaldo
                  ? Text(
                      saldo,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorName.textColor,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const Spacer(),
          Radio(
            value: valueRadio,
            groupValue: groupValueRadio,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
