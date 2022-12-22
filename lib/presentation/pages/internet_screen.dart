import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_telkomsel_ui/app_routes.dart';
import 'package:my_telkomsel_ui/dummy/data_dummy.dart';
import 'package:my_telkomsel_ui/presentation/widget/clear_glow_list.dart';
import 'package:my_telkomsel_ui/resources/assets.gen.dart';

import '../../resources/colors.gen.dart';
import '../widget/list_card_paket.dart';
import '../widget/title_and_see_more.dart';

class InternetScreen extends StatelessWidget {
  const InternetScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Paket Internet",
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: ColorName.textColor,
          ),
        ),
      ),
      body: ClearGlowList(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.searchScreen);
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  height: 44,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: ColorName.graySearch,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.images_search.path,
                        height: 16,
                        width: 16,
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        "Cari paket favorit kamu ...",
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorName.grayText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 20.0),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        Assets.images_terbaru_1.path,
                        height: 100,
                        width: 248,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        Assets.images_terbaru_2.path,
                        height: 100,
                        width: 248,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              const TitleAndSeeMore(
                seeMore: false,
                title: "Langganan Kamu",
              ),
              const SizedBox(height: 15.0),
              ListCardPaket(dataPaket: DataDummmy.paketLangganan),
              const SizedBox(height: 40.0),
              const TitleAndSeeMore(
                seeMore: true,
                title: "Kategori",
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 128,
                width: double.infinity,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    childAspectRatio: 60 / 139,
                  ),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  itemCount: DataDummmy.kategori.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final kategori = DataDummmy.kategori[index];
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        gradient: LinearGradient(
                          colors: [
                            ColorName.gradientHome1,
                            ColorName.gradientHome2,
                          ],
                        ),
                      ),
                      child: Text(
                        kategori,
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorName.backgroundScreen,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40.0),
              const TitleAndSeeMore(
                seeMore: true,
                title: "Popular",
              ),
              const SizedBox(height: 15.0),
              ListCardPaket(dataPaket: DataDummmy.paketPopular),
              const SizedBox(height: 40.0),
              const TitleAndSeeMore(
                seeMore: true,
                title: "Belanja#dirumahaja",
              ),
              const SizedBox(height: 15.0),
              ListCardPaket(dataPaket: DataDummmy.paketPopular),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
