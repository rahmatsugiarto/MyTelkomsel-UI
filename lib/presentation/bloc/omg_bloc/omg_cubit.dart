import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'omg_state.dart';

class OmgCubit extends Cubit<OmgState> {
  OmgCubit()
      : super(
          OmgState(
            indexIsCheckedUrutkan: -1,
            stateFilter: Filter(
              indexKategori: -1,
              indexKisaranHarga: -1,
              indexMasaAktif: -1,
              indexPenawaran: -1,
              selectedRange: const RangeValues(0, 250000),
            ),
            isUseFilter: false,
            isUseSort: false,
          ),
        );

  void checkedIndex(int index) {
    emit(state.copyWith(indexIsCheckedUrutkan: index));
  }

  void selectedRange(RangeValues rangeValue) {
    emit(
      state.copyWith(
        stateFilter: state.stateFilter.copyWith(selectedRange: rangeValue),
      ),
    );
  }

  void indexKategori(int index) {
    emit(
      state.copyWith(
        stateFilter: state.stateFilter.copyWith(indexKategori: index),
      ),
    );
  }

  void indexKisaranHarga(int index) {
    emit(
      state.copyWith(
        stateFilter: state.stateFilter.copyWith(indexKisaranHarga: index),
      ),
    );
  }

  void indexMasaAktif(int index) {
    emit(
      state.copyWith(
        stateFilter: state.stateFilter.copyWith(indexMasaAktif: index),
      ),
    );
  }

  void indexPenawaran(int index) {
    emit(
      state.copyWith(
        stateFilter: state.stateFilter.copyWith(indexPenawaran: index),
      ),
    );
  }

  void clearFilter() {
    emit(
      state.copyWith(
        stateFilter: state.stateFilter.copyWith(
          indexKategori: -1,
          indexKisaranHarga: -1,
          indexMasaAktif: -1,
          indexPenawaran: -1,
          selectedRange: const RangeValues(0, 250000),
        ),
        isUseFilter: false,
      ),
    );
  }

  void clearFilterSort() {
    emit(state.copyWith(
      indexIsCheckedUrutkan: -1,
      isUseSort: false,
    ));
  }

  void setIsUseFilter(bool useFilter) {
    emit(state.copyWith(isUseFilter: useFilter));
  }

  void setIsUseSort(bool useSort) {
    emit(state.copyWith(isUseSort: useSort));
  }
}
