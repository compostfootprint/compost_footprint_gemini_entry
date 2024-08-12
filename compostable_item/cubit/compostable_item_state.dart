part of 'compostable_item_cubit.dart';

enum CompostableItemStatus { initial, loading, success, error }

class CompostableItemState extends Equatable {
  final CompostableItemStatus status;
  final CompostableItemModel compostableItem;
  final String error;
  const CompostableItemState(this.status, this.compostableItem, this.error);

  @override
  List<Object> get props => [status, compostableItem, error];

  CompostableItemState copyWith({
    CompostableItemStatus? status,
    CompostableItemModel? compostableItem,
    String? error,
  }) {
    return CompostableItemState(
      status ?? this.status,
      compostableItem ?? this.compostableItem,
      error ?? this.error,
    );
  }
}
