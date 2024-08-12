import 'package:compost_footprint/authentication/view/splash_screen.dart';
import 'package:compost_footprint/compostable_item/cubit/compostable_item_cubit.dart';
import 'package:compost_footprint/search/cubit/search_cubit.dart';
import 'package:compost_footprint/style_guide/compost_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_locator.dart' as di;
import 'stats/cubit/stats_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.setupLocator();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<SearchCubit>(
        create: (context) => di.sl<SearchCubit>(),
      ),
      BlocProvider<CompostableItemCubit>(
        create: (context) => di.sl<CompostableItemCubit>(),
      ),
      BlocProvider<StatsCubit>(
        create: (context) => di.sl<StatsCubit>()..getStats(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Compost Footprint',
      theme: ThemeData(
        scaffoldBackgroundColor: CompostColors.compostBackground,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
