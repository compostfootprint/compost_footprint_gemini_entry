import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:compost_footprint/compostable_item/model/compostable_item_model.dart';
import 'package:equatable/equatable.dart';

import '../repository/search_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _searchRepository;
  SearchCubit(this._searchRepository)
      : super(SearchState(
            CompostableItemModel.empty(), SearchStatus.initial, ''));

  void searchItem(String itemName) async {
    emit(state.copyWith(status: SearchStatus.loading));
    try {
      final CompostableItemModel item =
          await _searchRepository.searchItem(itemName);
      emit(state.copyWith(compostableItem: item, status: SearchStatus.success));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: e.toString(), status: SearchStatus.failure));
    }
  }
}
