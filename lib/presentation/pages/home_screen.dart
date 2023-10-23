// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_telkomsel_ui/dummy/data_dummy.dart';
import 'package:my_telkomsel_ui/resources/assets.gen.dart';

import '../../app_routes.dart';
import '../../resources/colors.gen.dart';
import '../widget/card_item_home.dart';
import '../widget/clear_glow_list.dart';
import '../widget/clip_info.dart';
import '../widget/item_bottom_nav.dart';
import '../widget/item_category.dart';
import '../widget/status_cart.dart';
import '../widget/title_and_see_more.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClearGlowList(
        child: CustomScrollView(
          slivers: [
            SliverLayoutBuilder(
              builder: (context, constraints) {
                final scrolled = constraints.scrollOffset > 200;
                return SliverAppBar(
                  backgroundColor: ColorName.backgroundScreen,
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1,
                    centerTitle: true,
                    title: SafeArea(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Hai, ",
                                    style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      color: scrolled
                                          ? ColorName.textColor
                                          : ColorName.backgroundScreen,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Rahmat",
                                        style: GoogleFonts.openSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: scrolled
                                              ? ColorName.textColor
                                              : ColorName.backgroundScreen,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    Assets.images_qr.path,
                                    color: scrolled
                                        ? ColorName.textColor
                                        : ColorName.backgroundScreen,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    background: Container(
                      color: ColorName.backgroundScreen,
                      child: Stack(
                        children: [
                          ClipPath(
                            clipper: ClipPathClass(),
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              color: ColorName.primaryColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ClipPath(
                              clipper: ClipInfoClass(),
                              child: Container(
                                height: 238,
                                padding: const EdgeInsets.all(15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      ColorName.gradientHome1,
                                      ColorName.gradientHome2,
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "0821********",
                                            style: GoogleFonts.openSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: ColorName.backgroundScreen,
                                            ),
                                          ),
                                          const Spacer(),
                                          Image.asset(
                                            Assets.images_simpati_logo.path,
                                            height: 15,
                                            width: 84,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20.0),
                                      Text(
                                        "Sisa Pulsa Anda",
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: ColorName.backgroundScreen,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Text(
                                            "Rp100.000",
                                            style: GoogleFonts.openSans(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: ColorName.backgroundScreen,
                                            ),
                                          ),
                                          const Spacer(),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ColorName.yellowBg,
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              "Isi Pulsa",
                                              style: GoogleFonts.openSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: ColorName.textColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(thickness: 1),
                                      const SizedBox(height: 8.0),
                                      RichText(
                                        text: TextSpan(
                                          text: "Berlaku sampai ",
                                          style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            color: ColorName.backgroundScreen,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "31 Februari 2023",
                                              style: GoogleFonts.openSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    ColorName.backgroundScreen,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text(
                                            "Telkomsel POIN",
                                            style: GoogleFonts.openSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: ColorName.backgroundScreen,
                                            ),
                                          ),
                                          const SizedBox(width: 8.0),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 1,
                                              horizontal: 3,
                                            ),
                                            decoration: const BoxDecoration(
                                                color: ColorName.yellowBg,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(2))),
                                            child: Text(
                                              "172",
                                              style: GoogleFonts.openSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: ColorName.textColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  expandedHeight: 295,
                  toolbarHeight: 64,
                  elevation: 0,
                  pinned: true,
                );
              },
            ),
            SliverToBoxAdapter(
              child: ClearGlowList(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 13, 20, 13),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StatusCard(
                                title: "Internet",
                                data: "12.19",
                                satuan: 'GB',
                              ),
                              StatusCard(
                                title: "Telpon",
                                data: "0",
                                satuan: 'Min',
                              ),
                              StatusCard(
                                title: "SMS",
                                data: "23",
                                satuan: 'SMS',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Divider(thickness: 8),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kategori Paket",
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ColorName.textColor,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ItemCategory(
                                      image: Assets.images_internet_logo.path,
                                      title: 'Internet',
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.internetScreen,
                                        );
                                      },
                                    ),
                                    ItemCategory(
                                      image: Assets.images_telpon_logo.path,
                                      title: 'Telpon',
                                      onTap: () {},
                                    ),
                                    ItemCategory(
                                      image: Assets.images_sms_logo.path,
                                      title: 'SMS',
                                      onTap: () {},
                                    ),
                                    ItemCategory(
                                      image: Assets.images_roaming_logo.path,
                                      title: 'Roaming',
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ItemCategory(
                                      image: Assets.images_hiburan_logo.path,
                                      title: 'Hiburan',
                                      onTap: () {},
                                    ),
                                    ItemCategory(
                                      image: Assets.images_unggulan_logo.path,
                                      title: 'Unggulan',
                                      onTap: () {},
                                    ),
                                    ItemCategory(
                                      image: Assets.images_tersimpan_logo.path,
                                      title: 'Tersimpan',
                                      onTap: () {},
                                    ),
                                    ItemCategory(
                                      image: Assets.images_riwayat_logo.path,
                                      title: 'Riwayat',
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const TitleAndSeeMore(
                          seeMore: true,
                          title: "Terbaru dari Telkomsel",
                        ),
                        const SizedBox(height: 15.0),
                        SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            scrollDirection: Axis.horizontal,
                            itemCount: DataDummmy.terbaruDariTelkomsel.length,
                            itemBuilder: (BuildContext context, int index) {
                              final data =
                                  DataDummmy.terbaruDariTelkomsel[index];
                              return Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  data.image,
                                  height: 100,
                                  width: 248,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        const TitleAndSeeMore(
                          seeMore: false,
                          title: "Tanggap COVID-19",
                        ),
                        const SizedBox(height: 15.0),
                        SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            itemCount: DataDummmy.tanggapCovid.length,
                            itemBuilder: (BuildContext context, int index) {
                              final data = DataDummmy.tanggapCovid[index];
                              return CardItemHome(
                                image: data.image,
                                title: data.message,
                                heightImage: 112,
                                widthCard: 248,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        const TitleAndSeeMore(
                          seeMore: true,
                          title: "AYO! Pake LinkAja!",
                        ),
                        const SizedBox(height: 8.0),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Pakai LinkAja untuk beli pulsa, beli paket data dan bayar tagihan lebih mudah.",
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: ColorName.textColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        SizedBox(
                          height: 140,
                          width: double.infinity,
                          child: ListView.builder(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: DataDummmy.ayokPakeLinkAja.length,
                            itemBuilder: (BuildContext context, int index) {
                              final data = DataDummmy.ayokPakeLinkAja[index];
                              return CardItemHome(
                                image: data.image,
                                title: data.message,
                                heightImage: 96,
                                widthCard: 145,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        const TitleAndSeeMore(
                          seeMore: true,
                          title: "Cari Voucher, Yuk!!",
                        ),
                        const SizedBox(height: 15.0),
                        SizedBox(
                          height: 175,
                          width: double.infinity,
                          child: ListView.builder(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: DataDummmy.cariVouhcer.length,
                            itemBuilder: (BuildContext context, int index) {
                              final data = DataDummmy.cariVouhcer[index];
                              return CardItemHome(
                                image: data.image,
                                title: data.message,
                                heightImage: 112,
                                widthCard: 248,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        const TitleAndSeeMore(
                          seeMore: true,
                          title: "Penawaran Khusus",
                        ),
                        const SizedBox(height: 15.0),
                        SizedBox(
                          height: 175,
                          width: double.infinity,
                          child: ListView.builder(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: DataDummmy.penawaranKhusus.length,
                            itemBuilder: (BuildContext context, int index) {
                              final data = DataDummmy.penawaranKhusus[index];
                              return CardItemHome(
                                image: data.image,
                                title: data.message,
                                heightImage: 112,
                                widthCard: 248,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ItemBottomNav(
                active: true,
                image: Assets.images_beranda_active.path,
                label: 'Beranda',
              ),
              ItemBottomNav(
                active: false,
                image: Assets.images_riwayat.path,
                label: 'Riwayat',
              ),
              ItemBottomNav(
                active: false,
                image: Assets.images_bantuan.path,
                label: 'Bantuan',
              ),
              ItemBottomNav(
                active: false,
                image: Assets.images_inbox.path,
                label: 'Inbox',
                heightSpace: 7,
              ),
              ItemBottomNav(
                active: false,
                image: Assets.images_akun.path,
                label: 'Akun',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
