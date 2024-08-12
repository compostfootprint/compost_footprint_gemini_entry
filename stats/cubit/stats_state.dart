part of 'stats_cubit.dart';

enum StatsStatus { initial, loading, success, failure }

class StatsState extends Equatable {
  final StatsStatus status;
  final num totalCo2Saved;
  final num totalLandfillSaved;
  final String errorMessage;
  const StatsState(this.status, this.totalCo2Saved, this.totalLandfillSaved,
      this.errorMessage);

  @override
  List<Object> get props =>
      [status, totalCo2Saved, totalLandfillSaved, errorMessage];

  // copywith
  StatsState copyWith({
    StatsStatus? status,
    num? totalCo2Saved,
    num? totalLandfillSaved,
    String? errorMessage,
  }) {
    return StatsState(
      status ?? this.status,
      totalCo2Saved ?? this.totalCo2Saved,
      totalLandfillSaved ?? this.totalLandfillSaved,
      errorMessage ?? this.errorMessage,
    );
  }
}
