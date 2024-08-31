import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBAR extends StatefulWidget {
  String title;
  AppBAR({super.key, required this.title});

  @override
  State<AppBAR> createState() => _AppBARState();
}

class _AppBARState extends State<AppBAR> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
        color: Colors.white,
        width: screenWidth,
        height: screenHeight * 0.07,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16,),
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Icon(Icons.arrow_back_ios)),
                  ],
                ),
                // child: Center(child: Icon(Icons.arrow_back_ios)),
              ),
              // SizedBox(width: screenWidth*0.3,),
              Spacer(),
              Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Spacer(),
              SizedBox(width: 45,),
            ],
          ),
        ),
      ),
    );
  }
}
