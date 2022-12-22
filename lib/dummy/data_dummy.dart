class DataDummmy {
  static List<PaketModel> paketLangganan = [
    PaketModel(
      namaPaket: "Internet OMG!",
      masaPaket: '30 Hari',
      hargaNormal: 'Rp99.000',
      hargaPromo: 'Rp96.000',
      kuota: '14 GB',
    ),
    PaketModel(
      namaPaket: "iPhone Plan",
      masaPaket: '30 Hari',
      hargaNormal: 'Rp145.000',
      hargaPromo: 'Rp133.000',
      kuota: '27 GB',
    ),
  ];

  static List<String> kategori = [
    "MyTelkomsel Reward",
    "Combo SAKTI",
    "Paket Conference",
    "Internet Mingguan",
    "Internet Mingguan",
    "iPhone Plan",
    "Internet OMG!",
    "Extra Unlimited",
    "Kuota Keluarga",
    "Ketengan Utama",
    "Ketengan Tiktok",
    "Ketengan Youtube",
    "Ketengan Instagram",
    "Ketengan Facebook",
    "Pendidikan",
    "Bundling CloudMAX",
    "Paket Internet Malam",
  ];

  static List<PaketModel> paketPopular = [
    PaketModel(
      namaPaket: "Internet OMG!",
      masaPaket: '30 Hari',
      hargaNormal: 'Rp99.000',
      hargaPromo: 'Rp96.000',
      kuota: '14 GB',
    ),
    PaketModel(
      namaPaket: "Kuota Keluarga",
      masaPaket: '30 Hari',
      hargaNormal: 'Rp150.000',
      hargaPromo: '',
      kuota: '20 GB',
    ),
    PaketModel(
      namaPaket: "Combo OMG!",
      masaPaket: '30 Hari',
      hargaNormal: 'Rp155.000',
      hargaPromo: 'Rp139.000',
      kuota: '30 GB',
    ),
    PaketModel(
      namaPaket: "RuangGuru",
      masaPaket: '30 Hari',
      hargaNormal: '',
      hargaPromo: 'FREE',
      kuota: '30 GB',
    ),
  ];

  static List<String> terakhirDiCari = [
    "ruang guru",
    "omg",
    "ketengan",
    "ilmupedia",
  ];

  static List<String> pencarianPopuler = [
    "ruang guru",
    "ketengan",
    "Conference",
    "omg",
    "ilmupedia",
  ];

  static List<PaketModel> searchOmg = [
    PaketModel(
      namaPaket: "Internet OMG!",
      masaPaket: '30 Hari',
      hargaNormal: 'Rp99.000',
      hargaPromo: 'Rp96.000',
      kuota: '14 GB',
    ),
    PaketModel(
      namaPaket: "Internet OMG!",
      masaPaket: '30 Hari',
      hargaNormal: 'Rp154.000',
      hargaPromo: 'Rp141.000',
      kuota: '27 GB',
    ),
    PaketModel(
      namaPaket: "Combo OMG!",
      masaPaket: '30 Hari',
      hargaNormal: 'Rp63.000',
      hargaPromo: 'Rp61.000',
      kuota: '6.5 GB',
    ),
    PaketModel(
      namaPaket: "Internet OMG!",
      masaPaket: '30 Hari',
      hargaNormal: 'Rp38.000',
      hargaPromo: 'Rp37.000',
      kuota: '4 GB',
    ),
    PaketModel(
      namaPaket: "Internet OMG!",
      masaPaket: '30 Hari',
      hargaNormal: 'Rp63.000',
      hargaPromo: 'Rp61.000',
      kuota: '7 GB',
    ),
    PaketModel(
      namaPaket: "Internet OMG!",
      masaPaket: '30 Hari',
      hargaNormal: 'Rp150.000',
      hargaPromo: 'Rp100.000',
      kuota: '52 GB',
    ),
    PaketModel(
      namaPaket: "Combo OMG!",
      masaPaket: '30 Hari',
      hargaNormal: 'Rp119.000',
      hargaPromo: 'Rp100.000',
      kuota: '19 GB',
    ),
    PaketModel(
      namaPaket: "Combo OMG!",
      masaPaket: '30 Hari',
      hargaNormal: 'Rp155.000',
      hargaPromo: 'Rp139.000',
      kuota: '33 GB',
    ),
  ];

  static List<String> rangeHarga = [
    "0 - 10rb",
    "10rb - 50rb",
    "50rb - 100rb",
    "100rb - 500rb",
  ];

  static List<String> kategoriFilter = [
    "Combo OMG!",
    "Bebas Akses",
    "iPhone Plan",
    "Sahur Internet",
    "Pendidikan",
    "Intenet OMG!",
  ];

  static List<String> masaAktifFilter = [
    "30 HARI",
    "7 HARI",
    "1 HARI",
  ];

  static List<String> penawaranFilter = [
    "Diskon",
    "#dirumahaja",
    "Cashback",
    "POIN",
  ];

  static List<String> urutkanFilter = [
    "Paling Sesuai",
    "Terbaru",
    "Harga Terendah",
    "Harga Tertinggi",
  ];
}

class PaketModel {
  final String namaPaket;
  final String kuota;
  final String masaPaket;
  final String hargaNormal;
  final String hargaPromo;

  PaketModel({
    required this.namaPaket,
    required this.masaPaket,
    required this.hargaNormal,
    required this.hargaPromo,
    required this.kuota,
  });
}
