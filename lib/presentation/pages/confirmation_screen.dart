import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_telkomsel_ui/app_routes.dart';
import 'package:my_telkomsel_ui/presentation/bloc/confirmation_bloc/confirmation_cubit.dart';
import 'package:my_telkomsel_ui/presentation/bloc/confirmation_bloc/confirmation_state.dart';

import '../../resources/assets.gen.dart';
import '../../resources/colors.gen.dart';

class ConfirmationScreen extends StatelessWidget {
  final String numberPhone;
  const ConfirmationScreen({super.key, required this.numberPhone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: BlocConsumer<ConfirmationCubit, ConfirmationState>(
            listener: (context, state) {
              if (state.isLoading) {
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.home, (route) => false);
                });
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    Assets.images_login2.path,
                    height: 112,
                    width: 112,
                  ),
                  const SizedBox(height: 40.0),
                  Text(
                    "Masukan kode unik yang kami kirim",
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  RichText(
                    text: TextSpan(
                      text:
                          "Silakan periksa SMS kamu dan masukan kode unik yang kami kirimkan ke",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        color: ColorName.textColor,
                      ),
                      children: [
                        TextSpan(
                          text: " $numberPhone",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorName.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Kode Unik",
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Cth. q5TsgHxxx",
                    ),
                    onChanged: ((value) {
                      return context
                          .read<ConfirmationCubit>()
                          .checkNumberIsNotEmpty(value);
                    }),
                  ),
                  const SizedBox(height: 10.0),
                  RichText(
                    text: TextSpan(
                      text: "Tidak Menerima SMS ? ",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        color: ColorName.textColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Kirim ulang",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorName.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              debugPrint("Kirim ulang : Clicked");
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  state.isLoading
                      ? SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorName.primaryColor,
                            ),
                            onPressed: null,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  "LOADING",
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorName.primaryColor,
                            ),
                            onPressed: state.isEmpty
                                ? () => context
                                    .read<ConfirmationCubit>()
                                    .submitUniqueCode()
                                : null,
                            child: Text(
                              state.isEmpty ? "LANJUT" : "MASUK",
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
