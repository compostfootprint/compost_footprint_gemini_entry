import 'package:compost_footprint/compostable_item/model/compostable_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/compostable_repository.dart';

part 'compostable_item_state.dart';

class CompostableItemCubit extends Cubit<CompostableItemState> {
  final CompostableRepository _repository;
  CompostableItemCubit(this._repository)
      : super(CompostableItemState(
            CompostableItemStatus.initial, CompostableItemModel.empty(), ''));

  Future<void> addItemToCompost(CompostableItemModel compostableItem) async {
    emit(state.copyWith(status: CompostableItemStatus.loading));
    try {
      await _repository.addItemToCompost(compostableItem);
      emit(state.copyWith(status: CompostableItemStatus.success));
    } catch (e) {
      emit(state.copyWith(
          status: CompostableItemStatus.error, error: e.toString()));
    }
  }
}
