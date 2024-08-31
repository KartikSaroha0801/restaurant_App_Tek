import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/payment_confirmation.dart';
import 'package:restaurent_app_tek/widgets/app_bar.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppBAR(title: "Payment Mode"),
            Text(
                "This will be our Payment Page as per the payment gateway"),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: (){
                  Get.to(() => PaymentConfirmation());    
                },
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.06,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF3A30),
                    borderRadius: BorderRadius.circular(31),
                  ),
                  child: Center(
                    child: Text(
                      "Proceed to Pay",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: "Poppins",
                          ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight*0.02,),
          ],
        ),
      ),
    );
  }
}
