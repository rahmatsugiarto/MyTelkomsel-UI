import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit()
      : super(const SearchState(searchText: "", isShowBtnClearSearch: false));

  void showBtnClear(String searchText) {
    if (searchText.isEmpty) {
      emit(state.copyWith(isShowBtnClearSearch: false));
    } else {
      emit(state.copyWith(isShowBtnClearSearch: true));
    }
  }

  void search(String searchText) {
    if (searchText.isEmpty) {
      emit(state.copyWith(isShowBtnClearSearch: false));
    } else {
      emit(state.copyWith(isShowBtnClearSearch: true, searchText: searchText));
    }
  }
}
