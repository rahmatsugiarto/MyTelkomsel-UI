class SearchState {
  final String searchText;
  final bool isShowBtnClearSearch;

  const SearchState({
    required this.searchText,
    required this.isShowBtnClearSearch,
  });

  SearchState copyWith({
     String? searchText,
     bool? isShowBtnClearSearch,
  }) {
    return SearchState(
      searchText: searchText ?? this.searchText,
      isShowBtnClearSearch: isShowBtnClearSearch ?? this.isShowBtnClearSearch,
    );
  }
}
