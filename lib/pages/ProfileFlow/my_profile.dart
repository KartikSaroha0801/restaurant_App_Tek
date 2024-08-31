import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/add_to_cart.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/homepage.dart';
import 'package:restaurent_app_tek/pages/My%20Order%20Flow/my_order.dart';
import 'package:restaurent_app_tek/pages/ProfileFlow/about_us.dart';
import 'package:restaurent_app_tek/pages/ProfileFlow/privacy_policy.dart';
import 'package:restaurent_app_tek/pages/ProfileFlow/setting.dart';
import 'package:restaurent_app_tek/pages/ProfileFlow/support.dart';
import 'package:restaurent_app_tek/pages/ProfileFlow/terms&conditions.dart';
import 'package:restaurent_app_tek/widgets/custom_bottom_nav_bar.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
   int _currentIndex = 3; 

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    
    if (index == 0) {
      Get.offAll(() => HomePage()); 
    } else if (index == 1) {
      // Get.offAll(() =>AddToCartPage()); 
    } else if (index == 2) {
      Get.offAll(() =>MyOrderPage());
    } else if (index == 3) {
      Get.offAll(() =>MyProfile());
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.06,
            ),
            Center(child: Image.asset("assets/images/profile_picture.png")),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Center(
              child: Text(
                'Ravi Sharma',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: Text(
                '+91 7820078200',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: screenHeight*0.03,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        'My Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                      ListTile(
                      leading: Text(
                        'Order History',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                      InkWell(
                        onTap: (){
                          Get.to(()=> SupportPage());
                        },
                        child: ListTile(
                        leading: Text(
                          'Support',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                                            ),
                      ),
                      ListTile(
                      leading: Text(
                        'Rate Us',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                      InkWell(
                        onTap: (){
                          Get.to(() => PrivacyPolicy());
                        },
                        child: ListTile(
                        leading: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                                            ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(()=> AboutUs());
                        },
                        child: ListTile(
                        leading: Text(
                          'About Us',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                                            ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(() => TermsConditions());
                        },
                        child: ListTile(
                        leading: Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                                            ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(()=> SettingPage());
                        },
                        child: ListTile(
                        leading: Text(
                          'Setting',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                                            ),
                      ),
                    SizedBox(height: screenHeight*0.02,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
  width: double.infinity,
  height: screenHeight*0.06,
  // padding: const EdgeInsets.only(top: 18, bottom: 17),
  clipBehavior: Clip.antiAlias,
  decoration: ShapeDecoration(
    color: Color(0xFFF5F5F5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(31),
    ),
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Sign Out',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,

        ),
      ),
    ],
  ),
)
                  ],
                ),
              ),
            )
          ],
        ),

      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
