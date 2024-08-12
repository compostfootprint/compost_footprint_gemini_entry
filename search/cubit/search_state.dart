part of 'search_cubit.dart';

enum SearchStatus { initial, loading, success, failure }

class SearchState extends Equatable {
  final CompostableItemModel compostableItem;
  final SearchStatus status;
  final String errorMessage;

  const SearchState(this.compostableItem, this.status, this.errorMessage);

  @override
  List<Object> get props => [compostableItem, status, errorMessage];

  SearchState copyWith({
    CompostableItemModel? compostableItem,
    SearchStatus? status,
    String? errorMessage,
  }) {
    return SearchState(
      compostableItem ?? this.compostableItem,
      status ?? this.status,
      errorMessage ?? this.errorMessage,
    );
  }
}
