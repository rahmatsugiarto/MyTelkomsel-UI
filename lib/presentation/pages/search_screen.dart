import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_telkomsel_ui/app_routes.dart';
import 'package:my_telkomsel_ui/dummy/data_dummy.dart';
import 'package:my_telkomsel_ui/presentation/bloc/search_bloc/search_cubit.dart';
import 'package:my_telkomsel_ui/presentation/widget/title_and_see_more.dart';

import '../../resources/assets.gen.dart';
import '../../resources/colors.gen.dart';
import '../bloc/search_bloc/search_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchC = TextEditingController();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                                  autofocus: true,
                                  decoration: const InputDecoration(
                                    hintText: 'Cari paket favorit kamu ...',
                                    contentPadding: EdgeInsets.zero,
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    context.read<SearchCubit>().search(value);
                                  },
                                  onSubmitted: (value) {
                                    if (value.isNotEmpty) {
                                      Navigator.pushNamed(
                                          context, AppRoutes.omgScreen);
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              state.isShowBtnClearSearch
                                  ? GestureDetector(
                                      child: SvgPicture.asset(
                                        Assets.images_close_circle.path,
                                        height: 16,
                                        width: 16,
                                      ),
                                      onTap: () {
                                        searchC.clear();
                                        context
                                            .read<SearchCubit>()
                                            .showBtnClear(searchC.text);
                                        log("Delete ${searchC.text}");
                                      },
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Center(
                              child: Text(
                                "Batal",
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorName.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                const TitleAndSeeMore(seeMore: false, title: 'Terakhir dicari'),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: DataDummmy.terakhirDiCari.length,
                  itemBuilder: (BuildContext context, int index) {
                    final history = DataDummmy.terakhirDiCari[index];
                    return Container(
                      height: 44,
                      margin: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(Assets.images_time_backward.path),
                          const SizedBox(width: 10.0),
                          Text(
                            history,
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorName.textColor,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(Assets.images_round_close.path),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                const TitleAndSeeMore(
                    seeMore: false, title: 'Pencarian Populer'),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ...List.generate(
                        DataDummmy.pencarianPopuler.length,
                        (index) {
                          final populer = DataDummmy.pencarianPopuler[index];
                          return GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorName.primaryColor,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Text(
                                populer,
                                style: GoogleFonts.openSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: ColorName.primaryColor,
                                ),
                              ),
                            ),
                            onTap: () {
                              if (populer == DataDummmy.pencarianPopuler[3]) {
                                Navigator.pushNamed(
                                    context, AppRoutes.omgScreen);
                              }
                              log(populer);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
