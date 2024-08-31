import 'package:flutter/material.dart';
import 'package:restaurent_app_tek/widgets/app_bar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(
        children: [
          AppBAR(title: "Privacy Policy"),
        ],
      )),
    );
  }
}