import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:compost_footprint/compostable_item/cubit/compostable_item_cubit.dart';
import 'package:compost_footprint/compostable_item/repository/compostable_repository.dart';
import 'package:compost_footprint/stats/cubit/stats_cubit.dart';
import 'package:compost_footprint/stats/repository/stats_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'search/cubit/search_cubit.dart';
import 'search/repository/search_repository.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // Register services
  sl.registerLazySingleton<FirebaseFunctions>(() => FirebaseFunctions.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Register repositories
  sl.registerLazySingleton<SearchRepository>(() => SearchRepository(sl()));
  sl.registerLazySingleton<CompostableRepository>(
      () => CompostableRepository(sl(), sl()));
  sl.registerLazySingleton<StatsRepository>(() => StatsRepository(sl(), sl()));

  // Register cubits
  sl.registerFactory<SearchCubit>(() => SearchCubit(sl()));
  sl.registerFactory<CompostableItemCubit>(() => CompostableItemCubit(sl()));
  sl.registerFactory<StatsCubit>(() => StatsCubit(sl()));
}
