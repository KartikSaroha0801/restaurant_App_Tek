import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/paymentPage.dart';
import 'package:restaurent_app_tek/widgets/app_bar.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  bool showAddressFields = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppBAR(title: "Add Address"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.11,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 8,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(child: LocationTile()),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showAddressFields = !showAddressFields;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "+Add Address",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  if (showAddressFields) // Show address fields if true
                    Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 8,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            TextFormField(
                              controller: address1Controller,
                              decoration: InputDecoration(
                                labelText: 'Address 1',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            TextFormField(
                              controller: address2Controller,
                              decoration: InputDecoration(
                                labelText: 'Address 2',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: cityController,
                                    decoration: InputDecoration(
                                      labelText: 'City',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: TextFormField(
                                    controller: pincodeController,
                                    decoration: InputDecoration(
                                      labelText: 'Pincode',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            TextFormField(
                              controller: stateController,
                              decoration: InputDecoration(
                                labelText: 'State',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            GestureDetector(
                              onTap: () {
                                // Handle Save action
                              },
                              child: Container(
                                width: 100,
                                height: screenHeight * 0.045,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFF3A30),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Center(
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: screenHeight * 0.28,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Summary",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins"),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Qty.",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins"),
                        ),
                        Text(
                          "1",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Charges",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins"),
                        ),
                        Text(
                          "₹ 45.00",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFE3D58),
                              fontFamily: "Poppins"),
                        ),
                        Text(
                          "₹ 280.00",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFE3D58),
                              fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => PaymentPage());
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class LocationTile extends StatefulWidget {
  @override
  _LocationTileState createState() => _LocationTileState();
}

class _LocationTileState extends State<LocationTile> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Radio<int>(
        value: 1,
        groupValue: selectedValue,
        onChanged: (int? value) {
          setState(() {
            selectedValue = value;
          });
        },
        activeColor: Colors.red,
      ),
      title: Text(
        'B Block Rd',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
          fontFamily: "Poppins",
        ),
      ),
      subtitle: Text(
        'B Block Rd, B Block, Sector 63, Noida, Uttar Pradesh 201301, India',
        style: TextStyle(
          color: Colors.black.withOpacity(0.6000000238418579),
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
      ),
      onTap: () {
        setState(() {
          if (selectedValue == 1) {
            selectedValue = null;
          } else {
            selectedValue = 1;
          }
        });
      },
    );
  }
}
