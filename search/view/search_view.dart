import 'package:compost_footprint/components/compost_search_bar.dart';
import 'package:compost_footprint/search/cubit/search_cubit.dart';
import 'package:compost_footprint/stats/cubit/stats_cubit.dart';
import 'package:compost_footprint/style_guide/compost_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../compostable_item/view/compostable_item_view.dart';
import '../../style_guide/compost_text_styles.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state.status == SearchStatus.success) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CompostableItemView(
                      compostableItem: state.compostableItem)));
        } else if (state.status == SearchStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  color: CompostColors.compostWhite,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/carbon-footprint.png',
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CompostSearchBar(
                controller: controller,
                onSubmitted: (text) {
                  debugPrint('Search for $text');
                  context.read<SearchCubit>().searchItem(text);
                },
              ),
              const SizedBox(height: 24),
              const Text(
                  'Enter an item to check if its compostable, how much co2 you will save, how much landfill space you will save, and how much water you will save!',
                  style: CompostTextStyles.body,
                  textAlign: TextAlign.center),
              const SizedBox(height: 48),
              Center(
                child: BlocBuilder<StatsCubit, StatsState>(
                  builder: (context, state) {
                    return Text('${state.totalCo2Saved * 100}g',
                        style: CompostTextStyles.h1,
                        textAlign: TextAlign.center);
                  },
                ),
              ),
              const SizedBox(height: 4),
              const Center(
                child: Text('Total CO2 Saved!',
                    style: CompostTextStyles.h3, textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
