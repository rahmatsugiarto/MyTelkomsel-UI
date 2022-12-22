import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_telkomsel_ui/app_routes.dart';

import '../../resources/assets.gen.dart';
import '../../resources/colors.gen.dart';
import '../widget/item_rincian_paket.dart';

class DetailPackageScreen extends StatelessWidget {
  const DetailPackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
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
                              // controller: searchC,
                              textInputAction: TextInputAction.search,
                              decoration: const InputDecoration(
                                hintText: 'Cari paket favorit kamu ...',
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
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.images_round_share.path),
                    splashRadius: 1,
                    padding: const EdgeInsets.only(right: 15),
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Combo OMG!",
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SvgPicture.asset(
                        Assets.images_bookmark_fill.path,
                        height: 32,
                        width: 32,
                      )
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "6.5 GB",
                    style: GoogleFonts.openSans(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Rp63.000",
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorName.textColor,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    "Rp61.000",
                    style: GoogleFonts.openSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorName.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 8,
              color: ColorName.greyDivider,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Masa Aktif Paket",
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorName.textColor,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: ColorName.graySearch,
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.images_timer_sand.path,
                          color: ColorName.primaryColor,
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          "30 Hari",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorName.primaryColor,
                          ),
                        ),
                      ],
                    ),
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
                    "Rincian Paket",
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorName.textColor,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const ItemRincianPaket(title: "Internet", detail: "4.5 GB"),
                  const ItemRincianPaket(title: "OMG!", detail: "2 GB"),
                  const ItemRincianPaket(title: "SMS Tsel", detail: "60 SMS"),
                  const ItemRincianPaket(
                    title: "Voice Tsel",
                    detail: "100 Mins",
                    zeroMargin: true,
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
                    "Deskripsi Paket",
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorName.textColor,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Paket Internet OMG! berlaku untuk 30 hari, dengan rincian kuota:",
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorName.textColor,
                    ),
                  ),
                  const ItemDeskripsiPaket(
                    msg:
                        "Kuota Internet dengan akses di semua jaringan (2G/3G/4G).",
                  ),
                  const ItemDeskripsiPaket(
                    msg: "Kuota Nelpon ke Sesama Telkomsel",
                  ),
                  const ItemDeskripsiPaket(
                    msg:
                        "Kuota 2 GB OMG! untuk akses Youtube, Facebook, Instagram, MAXstream, Viu, iFlix, Klik Film, Bein Sport, dan Nickelodeon Play berlaku 30 hari.",
                  ),
                  const ItemDeskripsiPaket(
                    msg: "Termasuk berlangganan 30 hari.",
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
                    "Syarat dan Ketentuan",
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorName.textColor,
                    ),
                  ),
                  const ItemSK(
                    number: "1.",
                    sk: "Paket berlaku hanya untuk pemakaian dalam negeri (Tidak berlaku untuk pemakaian luar negeri).",
                  ),
                  const ItemSK(
                    number: "2.",
                    sk: "Setelah melewati volume yang disediakan, pelanggan akan dikenakan tarif normal.",
                  ),
                  const ItemSK(
                    number: "3.",
                    sk: "Kuota internet lokal hanya dapat digunakan di lokasi pelanggan melakukan aktivasi paket.",
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Selengkapnya",
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorName.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
            const Divider(
              thickness: 8,
              color: ColorName.greyDivider,
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorName.backgroundScreen,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorName.primaryColor,
            ),
            child: const Text("BELI SEKARANG"),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.paymentMethodScreen);
            },
          ),
        ),
      ),
    );
  }
}

class ItemSK extends StatelessWidget {
  final String number;
  final String sk;
  const ItemSK({
    Key? key,
    required this.number,
    required this.sk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ColorName.textColor,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 62,
            child: Text(
              sk,
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorName.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemDeskripsiPaket extends StatelessWidget {
  final String msg;
  const ItemDeskripsiPaket({
    Key? key,
    required this.msg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(height: 7.0),
              SvgPicture.asset(Assets.images_ellipse.path),
            ],
          ),
          const SizedBox(
            width: 10.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 56,
            child: Text(
              msg,
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorName.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
