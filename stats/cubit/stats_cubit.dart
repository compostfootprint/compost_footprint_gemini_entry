import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/stats_repository.dart';

part 'stats_state.dart';

class StatsCubit extends Cubit<StatsState> {
  final StatsRepository _repository;
  StatsCubit(this._repository)
      : super(const StatsState(StatsStatus.initial, 0, 0, ''));

  Future<void> getStats() async {
    emit(state.copyWith(status: StatsStatus.loading));
    try {
      final List<num> co2AndLandfillSaved = await _repository.getStats();
      emit(state.copyWith(
          status: StatsStatus.success,
          totalCo2Saved: co2AndLandfillSaved[0],
          totalLandfillSaved: co2AndLandfillSaved[1]));
    } catch (e) {
      emit(state.copyWith(status: StatsStatus.failure));
    }
  }
}
