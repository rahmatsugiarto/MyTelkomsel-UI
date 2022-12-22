import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_telkomsel_ui/presentation/widget/title_and_see_more.dart';

import '../../dummy/data_dummy.dart';
import '../../resources/colors.gen.dart';
import '../bloc/omg_bloc/omg_cubit.dart';
import '../bloc/omg_bloc/omg_state.dart';
import 'item_filter_search.dart';

Future<dynamic> showFilter(
  BuildContext context,
  TextEditingController minimalC,
  TextEditingController maximalC,
) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    constraints: const BoxConstraints(maxHeight: 661),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return BlocBuilder<OmgCubit, OmgState>(
        builder: (context, state) {
          minimalC.text =
              state.stateFilter.selectedRange.start.round().toString();
          maximalC.text =
              state.stateFilter.selectedRange.end.round().toString();
          log("${state.stateFilter.selectedRange.start.round()}");
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ColorName.backgroundScreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    8,
                    20,
                    0,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 6,
                        width: 62,
                        decoration: const BoxDecoration(
                          color: ColorName.greyDivider1,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Filter",
                            style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ColorName.textColor,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<OmgCubit>().clearFilter();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Hapus",
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ColorName.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: 566,
                  child: Stack(
                    children: [
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Kisaran harga",
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ColorName.textColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Minimal",
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: ColorName.textColor,
                                        ),
                                      ),
                                      TextField(
                                        controller: minimalC,
                                        keyboardType: TextInputType.phone,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          prefixText: "RP",
                                        ),
                                        // inputFormatters: [
                                        //   ThousandsSeparatorInputFormatter(),
                                        // ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Maksimal",
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: ColorName.textColor,
                                        ),
                                      ),
                                      TextField(
                                        controller: maximalC,
                                        keyboardType: TextInputType.phone,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          prefixText: "RP",
                                        ),
                                        // inputFormatters: [
                                        //   ThousandsSeparatorInputFormatter(),
                                        // ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: RangeSlider(
                                values: state.stateFilter.selectedRange,
                                min: 0,
                                max: 500000,
                                divisions: 10,
                                labels: RangeLabels(
                                  state.stateFilter.selectedRange.start
                                      .round()
                                      .toString(),
                                  state.stateFilter.selectedRange.end
                                      .round()
                                      .toString(),
                                ),
                                onChanged: (newRange) {
                                  context
                                      .read<OmgCubit>()
                                      .selectedRange(newRange);
                                }),
                          ),
                          ItemFilterSearch(
                            listData: DataDummmy.rangeHarga,
                            height: 40,
                            indexSelected: state.stateFilter.indexKisaranHarga,
                            onTap: (index) {
                              if (state.stateFilter.indexKisaranHarga ==
                                  index) {
                                context.read<OmgCubit>().indexKisaranHarga(-1);
                              } else {
                                context
                                    .read<OmgCubit>()
                                    .indexKisaranHarga(index);
                              }
                            },
                          ),
                          const SizedBox(height: 30.0),
                          const TitleAndSeeMore(
                            seeMore: true,
                            title: 'Kategori',
                          ),
                          const SizedBox(height: 20.0),
                          ItemFilterSearch(
                            listData: DataDummmy.kategoriFilter,
                            height: 44,
                            indexSelected: state.stateFilter.indexKategori,
                            onTap: (index) {
                              if (state.stateFilter.indexKategori == index) {
                                context.read<OmgCubit>().indexKategori(-1);
                              } else {
                                context.read<OmgCubit>().indexKategori(index);
                              }
                            },
                          ),
                          const SizedBox(height: 30.0),
                          const TitleAndSeeMore(
                            seeMore: true,
                            title: 'Masa Aktif',
                          ),
                          const SizedBox(height: 20.0),
                          ItemFilterSearch(
                            listData: DataDummmy.masaAktifFilter,
                            height: 44,
                            indexSelected: state.stateFilter.indexMasaAktif,
                            onTap: (index) {
                              if (state.stateFilter.indexMasaAktif == index) {
                                context.read<OmgCubit>().indexMasaAktif(-1);
                              } else {
                                context.read<OmgCubit>().indexMasaAktif(index);
                              }
                            },
                            isMasaAktif: true,
                          ),
                          const SizedBox(height: 30.0),
                          const TitleAndSeeMore(
                            seeMore: true,
                            title: 'Penawaran',
                          ),
                          const SizedBox(height: 20.0),
                          ItemFilterSearch(
                            listData: DataDummmy.penawaranFilter,
                            height: 44,
                            indexSelected: state.stateFilter.indexPenawaran,
                            onTap: (index) {
                              if (state.stateFilter.indexPenawaran == index) {
                                context.read<OmgCubit>().indexPenawaran(-1);
                              } else {
                                context.read<OmgCubit>().indexPenawaran(index);
                              }
                            },
                          ),
                          const SizedBox(height: 100.0),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: ColorName.backgroundScreen,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          height: 72,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<OmgCubit>().setIsUseFilter(true);
                              Navigator.pop(context);
                            },
                            child: Text(
                              "PASANG FILTER",
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
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  ).then((value) {
    if (!context.read<OmgCubit>().state.isUseFilter) {
      context.read<OmgCubit>().clearFilter();
    }
  });
}
