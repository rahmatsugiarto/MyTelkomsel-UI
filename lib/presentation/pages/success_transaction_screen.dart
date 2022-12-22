import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_telkomsel_ui/app_routes.dart';
import 'package:my_telkomsel_ui/presentation/bloc/success_transaction_bloc/success_transaction_cubit.dart';
import 'package:my_telkomsel_ui/resources/assets.gen.dart';
import 'package:my_telkomsel_ui/resources/colors.gen.dart';

import '../bloc/success_transaction_bloc/success_transaction_state.dart';

class SuccessTransactionScreen extends StatelessWidget {
  const SuccessTransactionScreen({super.key});

  void clearExpTrx(BuildContext context) {
    context.read<SuccessTransactionCubit>().clearExpTransaction();
  }

  void setExpTrx(BuildContext context, bool value) {
    context.read<SuccessTransactionCubit>().setExperienceTransaction(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child:
                BlocBuilder<SuccessTransactionCubit, SuccessTransactionState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10.0),
                    AvatarGlow(
                      glowColor: ColorName.primaryColor,
                      endRadius: 100.0,
                      duration: const Duration(milliseconds: 3000),
                      showTwoGlows: false,
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      child: Material(
                        elevation: 5,
                        shape: const CircleBorder(),
                        child: SvgPicture.asset(
                            Assets.images_success_payment.path),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Text(
                      "Pembayaran Berhasil",
                      style: GoogleFonts.openSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorName.textColor,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "Pembayaran paket internet telah berhasil. Kami akan memberitahu kamu jika paket sudah diaktifkan.",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorName.textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "PAKET INTERNET",
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ColorName.textColor,
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              Text(
                                "Combo OMG! 6.5 GB",
                                style: GoogleFonts.openSans(
                                  fontSize: 18,
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
                                  color: ColorName.textColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Text(
                      "NO. TRANSAKSI",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorName.textColor,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "A3012005123095745810",
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorName.textColor,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Bagaimana traksaksi kamu?",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorName.textColor,
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: ColorName.graySearch,
                            ),
                            child: SvgPicture.asset(
                              Assets.images_thumb_up.path,
                              color: state.isGoodExp
                                  ? ColorName.primaryColor
                                  : ColorName.textColor,
                            ),
                          ),
                          onTap: () {
                            if (state.isGoodExp) {
                              clearExpTrx(context);
                            } else {
                              setExpTrx(context, true);
                            }
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: ColorName.graySearch,
                            ),
                            child: SvgPicture.asset(
                              Assets.images_thumb_down.path,
                              color: state.isBadExp
                                  ? ColorName.primaryColor
                                  : ColorName.textColor,
                            ),
                          ),
                          onTap: () {
                            if (state.isBadExp) {
                              clearExpTrx(context);
                            } else {
                              setExpTrx(context, false);
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      height: 52,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorName.primaryColor,
                        ),
                        child: Text(
                          "KEMBALI KE BERANDA",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.home,
                            (route) => false,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 52,
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: ColorName.primaryColor,
                          side: const BorderSide(color: ColorName.primaryColor),
                        ),
                        child: Text(
                          "LIHAT PAKET",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.home,
                            (route) => false,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
