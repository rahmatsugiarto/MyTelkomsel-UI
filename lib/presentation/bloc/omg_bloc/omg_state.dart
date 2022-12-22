import 'package:flutter/material.dart';

class OmgState {
  final int indexIsCheckedUrutkan;
  final Filter stateFilter;
  final bool isUseFilter;
  final bool isUseSort;

  const OmgState({
    required this.indexIsCheckedUrutkan,
    required this.stateFilter,
    required this.isUseFilter,
    required this.isUseSort,
  });

  OmgState copyWith({
    int? indexIsCheckedUrutkan,
    Filter? stateFilter,
    bool? isUseFilter,
    bool? isUseSort,
  }) {
    return OmgState(
      indexIsCheckedUrutkan:
          indexIsCheckedUrutkan ?? this.indexIsCheckedUrutkan,
      stateFilter: stateFilter ?? this.stateFilter,
      isUseFilter: isUseFilter ?? this.isUseFilter,
      isUseSort: isUseSort ?? this.isUseSort,
    );
  }
}

class Filter {
  final RangeValues selectedRange;
  final int indexKisaranHarga;
  final int indexKategori;
  final int indexMasaAktif;
  final int indexPenawaran;

  Filter({
    required this.selectedRange,
    required this.indexKisaranHarga,
    required this.indexKategori,
    required this.indexMasaAktif,
    required this.indexPenawaran,
  });

  Filter copyWith({
    RangeValues? selectedRange,
    int? indexKisaranHarga,
    int? indexKategori,
    int? indexMasaAktif,
    int? indexPenawaran,
  }) {
    return Filter(
      selectedRange: selectedRange ?? this.selectedRange,
      indexKisaranHarga: indexKisaranHarga ?? this.indexKisaranHarga,
      indexKategori: indexKategori ?? this.indexKategori,
      indexMasaAktif: indexMasaAktif ?? this.indexMasaAktif,
      indexPenawaran: indexPenawaran ?? this.indexPenawaran,
    );
  }
}
