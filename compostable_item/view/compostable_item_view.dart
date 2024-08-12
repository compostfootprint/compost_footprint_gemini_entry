import 'package:compost_footprint/compostable_item/model/compostable_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/compost_button.dart';
import '../../style_guide/compost_colors.dart';
import '../../style_guide/compost_text_styles.dart';
import '../cubit/compostable_item_cubit.dart';

class CompostableItemView extends StatelessWidget {
  final CompostableItemModel compostableItem;
  const CompostableItemView({super.key, required this.compostableItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFA259FF),
        body: Stack(
          children: [
            Image.asset('assets/images/placeholder.jpg'),
            // Image.network(compostableItem.imageUrl,
            //     errorBuilder: (context, error, stackTrace) {
            //   return Image.asset('images/assets/placeholder.jpg');
            // }),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 16, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: CompostColors.compostBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              decoration: const BoxDecoration(
                color: CompostColors.compostBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 24, 24, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        compostableItem.name,
                        style: CompostTextStyles.h1,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${compostableItem.co2Saved}kg',
                            style: CompostTextStyles.h1,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'CO2 saved',
                            style: TextStyle(
                              color: CompostColors.compostTextSecondary,
                              fontSize: 20,
                              fontFamily: 'SFProText',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${compostableItem.landfillSaved} Cubic Cm',
                            style: CompostTextStyles.h4,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Landfill saved',
                            style: TextStyle(
                              color: CompostColors.compostTextSecondary,
                              fontSize: 16,
                              fontFamily: 'SFProText',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        compostableItem.description,
                        style: CompostTextStyles.body,
                      ),
                      const SizedBox(height: 24),
                      CompostButton(
                          text: 'Add To My Compost',
                          onTap: () {
                            context
                                .read<CompostableItemCubit>()
                                .addItemToCompost(compostableItem);
                            Navigator.of(context).pop();
                          }),
                      const SizedBox(
                        height: 48,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
