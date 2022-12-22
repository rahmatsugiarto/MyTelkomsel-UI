import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../dummy/data_dummy.dart';
import '../../resources/assets.gen.dart';
import '../../resources/colors.gen.dart';
import '../bloc/omg_bloc/omg_cubit.dart';
import '../bloc/omg_bloc/omg_state.dart';

Future<dynamic> showSortFilter(
  BuildContext context,
) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    constraints: const BoxConstraints(maxHeight: 400),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  8,
                  20,
                  8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Container(
                        height: 6,
                        width: 62,
                        decoration: const BoxDecoration(
                          color: ColorName.greyDivider1,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Text(
                      "Urutkan",
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorName.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              BlocBuilder<OmgCubit, OmgState>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: DataDummmy.urutkanFilter.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = DataDummmy.urutkanFilter[index];
                      int indexIsChecked = -1;
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              if (state.indexIsCheckedUrutkan == index) {
                                context.read<OmgCubit>().clearFilterSort();
                              } else {
                                context.read<OmgCubit>().checkedIndex(index);
                              }

                              log("Klick ${indexIsChecked == index}");
                            },
                            splashColor: Colors.transparent,
                            child: Container(
                              height: 45,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data,
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: ColorName.textColor,
                                    ),
                                  ),
                                  state.indexIsCheckedUrutkan == index
                                      ? SvgPicture.asset(
                                          Assets.images_round_check.path)
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: ColorName.backgroundScreen,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 72,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (context.read<OmgCubit>().state.indexIsCheckedUrutkan !=
                      -1) {
                    context.read<OmgCubit>().setIsUseSort(true);
                  } else {
                    context.read<OmgCubit>().setIsUseSort(false);
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  "SIMPAN",
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorName.backgroundScreen,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    },
  ).then((value) {
    if (!context.read<OmgCubit>().state.isUseSort) {
      context.read<OmgCubit>().clearFilterSort();
    }
  });
}
