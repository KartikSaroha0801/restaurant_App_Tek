import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurent_app_tek/FieldWorker/Maintenance%20Flow/maintenance.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/homepage.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/productDescription.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/productlist.dart';
import 'package:restaurent_app_tek/pages/ProfileFlow/my_profile.dart';
import 'package:restaurent_app_tek/pages/Transvolt/transvolt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: HomePage(),
      // home: ProductListingPage(),
      // home: ProductDescriptionPage(),
      // home: HomePage(),
      // home: MyProfile(),
      // home: RecordsPage(),
      home: MaintenancePage(),
    );
  }
}
