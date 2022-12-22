// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_telkomsel_ui/app_routes.dart';
import 'package:my_telkomsel_ui/presentation/bloc/paymment_method_bloc/paymment_method_cubit.dart';
import 'package:my_telkomsel_ui/resources/assets.gen.dart';

import '../../resources/colors.gen.dart';
import '../bloc/paymment_method_bloc/paymment_method_state.dart';
import '../widget/item_payment_method.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Metode Pembayaran",
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorName.textColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Combo OMG! 6.5 GB",
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ColorName.textColor,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                "4.5 GB Internet + 2 GB OMG! + 60 SMS Tsel + 100 Mins Voice Tsel",
                                style: GoogleFonts.openSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorName.dartGreyText,
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    Assets.images_timer_sand.path,
                                    color: ColorName.primaryColor,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text(
                                    "Masa aktif 30 hari",
                                    style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: ColorName.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        "Pembayaran di MyTelkomsel",
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorName.textColor,
                        ),
                      ),
                      ItemPaymentMethod(
                        assetsSvg: Assets.images_bank_cards.path,
                        paymentMethod: 'Pulsa',
                        saldo: "12.000",
                        showSaldo: true,
                        valueRadio: 1,
                        groupValueRadio: state.valueGroupRadio,
                        onChanged: (value) {
                          context
                              .read<PaymentMethodCubit>()
                              .setValueGroupRadio(value ?? 0);
                        },
                      ),
                      ItemPaymentMethod(
                        assetsSvg: Assets.images_logo_link_aja.path,
                        paymentMethod: 'LinkAja',
                        saldo: "76.200",
                        showSaldo: true,
                        valueRadio: 2,
                        groupValueRadio: state.valueGroupRadio,
                        onChanged: (value) {
                          context
                              .read<PaymentMethodCubit>()
                              .setValueGroupRadio(value ?? 0);
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 8,
                  color: ColorName.greyDivider,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "E-Wallet",
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorName.textColor,
                        ),
                      ),
                      ItemPaymentMethod(
                        assetsSvg: Assets.images_logo_go_pay.path,
                        paymentMethod: 'Gopay',
                        valueRadio: 3,
                        groupValueRadio: state.valueGroupRadio,
                        onChanged: (value) {
                          context
                              .read<PaymentMethodCubit>()
                              .setValueGroupRadio(value ?? 0);
                        },
                      ),
                      ItemPaymentMethod(
                        assetsSvg: Assets.images_ovo_logo.path,
                        paymentMethod: 'OVO',
                        valueRadio: 4,
                        groupValueRadio: state.valueGroupRadio,
                        onChanged: (value) {
                          context
                              .read<PaymentMethodCubit>()
                              .setValueGroupRadio(value ?? 0);
                        },
                      ),
                      ItemPaymentMethod(
                        assetsSvg: Assets.images_logo_link_aja.path,
                        paymentMethod: 'LinkAja',
                        valueRadio: 5,
                        groupValueRadio: state.valueGroupRadio,
                        onChanged: (value) {
                          context
                              .read<PaymentMethodCubit>()
                              .setValueGroupRadio(value ?? 0);
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorName.backgroundScreen,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Pembayaran",
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorName.textColor,
                    ),
                  ),
                  Text(
                    "Rp61.000",
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorName.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorName.primaryColor,
                  ),
                  child: const Text("KONFIRMASI & BAYAR"),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AppRoutes.successTransactionScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
