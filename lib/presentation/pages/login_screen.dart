import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_telkomsel_ui/presentation/bloc/login_bloc/login_state.dart';

import '../../app_routes.dart';
import '../../resources/assets.gen.dart';
import '../../resources/colors.gen.dart';
import '../bloc/login_bloc/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController numberPhoneC = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (ctx, state) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Assets.images_login.path,
                      width: 148,
                      height: 133,
                    ),
                    const SizedBox(height: 40.0),
                    Text(
                      "Silakan masuk dengan nomer telkomsel kamu",
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Text(
                      "Nomor HP",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: numberPhoneC,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Cth. 0812901xxxx",
                      ),
                      onChanged: ((value) {
                        return context
                            .read<LoginCubit>()
                            .checkNumberIsNotEmpty(value);
                      }),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: state.isAgree,
                            onChanged: (value) =>
                                context.read<LoginCubit>().isAgree(),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: "Saya menyetujui",
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: ColorName.textColor,
                              ),
                              children: [
                                TextSpan(
                                  text: " syarat ketentuan",
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    color: ColorName.primaryColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      debugPrint("syarat ketentuan : Clicked");
                                    },
                                ),
                                TextSpan(
                                  text: ", dan",
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    color: ColorName.textColor,
                                  ),
                                ),
                                TextSpan(
                                  text: " privasi",
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    color: ColorName.primaryColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      debugPrint("privasi : Clicked");
                                    },
                                ),
                                TextSpan(
                                  text: " Telkomsel",
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    color: ColorName.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 25.0),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorName.primaryColor,
                        ),
                        onPressed: state.isAgree && state.isEmpty
                            ? () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.confirmationScreen,
                                  arguments: numberPhoneC.text.trim(),
                                );
                              }
                            : null,
                        child: Text(
                          state.isAgree && state.isEmpty ? "LANJUT" : "MASUK",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Center(
                      child: Text(
                        "Atau masuk menggunakan ",
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton.icon(
                          icon: SvgPicture.asset(Assets.images_fb.path),
                          label: Text(
                            "Facebook",
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: ColorName.fbColor,
                            ),
                          ),
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            fixedSize: MaterialStateProperty.all(
                              const Size(157, 42),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                color: ColorName.fbColor,
                              ),
                            ),
                          ),
                          onPressed: () {},
                        ),
                        OutlinedButton.icon(
                          icon: SvgPicture.asset(Assets.images_tw.path),
                          label: Text(
                            "Twitter",
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: ColorName.twColor,
                            ),
                          ),
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            fixedSize: MaterialStateProperty.all(
                              const Size(157, 42),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                color: ColorName.twColor,
                              ),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
