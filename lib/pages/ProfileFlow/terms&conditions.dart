import 'package:flutter/material.dart';
import 'package:restaurent_app_tek/widgets/app_bar.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppBAR(title: "Terms & Conditions"),
          ],
        ),
        ),
    );
  }
}
