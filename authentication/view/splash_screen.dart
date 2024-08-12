import 'dart:async';

import 'package:compost_footprint/components/compost_button.dart';
import 'package:compost_footprint/search/view/search_view.dart';
import 'package:compost_footprint/style_guide/compost_colors.dart';
import 'package:compost_footprint/style_guide/compost_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFA259FF),
        body: Stack(
          children: [
            Image.asset('assets/images/BG.png'),
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
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: CompostColors.compostWhite,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/carbon-footprint.png',
                          height: 80,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Compost Footprint',
                      style: CompostTextStyles.h1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                        'Your guide to sustainable living. Compete with friends to save the planet and grow free food in the process!',
                        style: CompostTextStyles.body,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 48),
                    CompostButton(
                        text: 'Sign In Anonomously',
                        onTap: () async {
                          final auth = FirebaseAuth.instance;
                          unawaited(auth.signInAnonymously());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchView()));
                        }),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
