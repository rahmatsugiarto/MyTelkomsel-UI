import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_telkomsel_ui/app_routes.dart';
import 'package:my_telkomsel_ui/presentation/bloc/omg_bloc/omg_cubit.dart';

import '../../dummy/data_dummy.dart';
import '../../resources/assets.gen.dart';
import '../../resources/colors.gen.dart';
import '../bloc/omg_bloc/omg_state.dart';
import '../widget/show_filter_BS.dart';
import '../widget/show_filter_sort_BS.dart';

class OmgScreen extends StatelessWidget {
  const OmgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchC = TextEditingController();
    final TextEditingController minimalC = TextEditingController();
    final TextEditingController maximalC = TextEditingController();
    final controllerScroll = ScrollController();
    searchC.text = "Omg";
    minimalC.text = "0";
    maximalC.text = "250.000";
    return Scaffold(
      body: BlocBuilder<OmgCubit, OmgState>(
        builder: (context, state) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1,
                  centerTitle: true,
                  title: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                height: 46,
                                margin: const EdgeInsets.only(left: 20),
                                child: Icon(Icons.adaptive.arrow_back),
                              ),
                              onTap: () => Navigator.maybePop(context),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(15, 0, 20, 0),
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                decoration: const BoxDecoration(
                                  color: ColorName.graySearch,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.images_search.path,
                                      height: 16,
                                      width: 16,
                                    ),
                                    const SizedBox(width: 10.0),
                                    Flexible(
                                      child: TextField(
                                        controller: searchC,
                                        textInputAction: TextInputAction.search,
                                        decoration: const InputDecoration(
                                          hintText:
                                              'Cari paket favorit kamu ...',
                                          contentPadding: EdgeInsets.zero,
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  background: Container(
                    color: ColorName.backgroundScreen,
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: const BoxDecoration(
                                      color: ColorName.graySearch,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.images_filter.path,
                                        color: state.isUseFilter
                                            ? ColorName.primaryColor
                                            : ColorName.textColor,
                                      ),
                                      Text(
                                        "Filter",
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: state.isUseFilter
                                              ? ColorName.primaryColor
                                              : ColorName.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  log('message');
                                  showFilter(
                                    context,
                                    minimalC,
                                    maximalC,
                                  );
                                },
                              ),
                              const SizedBox(width: 10.0),
                              GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: const BoxDecoration(
                                      color: ColorName.graySearch,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.images_sort.path,
                                        color: state.isUseSort
                                            ? ColorName.primaryColor
                                            : ColorName.textColor,
                                      ),
                                      Text(
                                        "Urutkan",
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: state.isUseSort
                                              ? ColorName.primaryColor
                                              : ColorName.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  showSortFilter(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                automaticallyImplyLeading: false,
                expandedHeight: 110,
                toolbarHeight: 64,
                elevation: 0,
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: DataDummmy.searchOmg.length,
                  (context, index) {
                    final data = DataDummmy.searchOmg[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.detailPackageScreen);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        height: 116,
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      data.kuota,
                                      style: GoogleFonts.openSans(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: ColorName.textColor,
                                      ),
                                    ),
                                    const SizedBox(width: 20.0),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                    const Spacer(),
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
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          )
                                        : const SizedBox(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
