import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurent_app_tek/FieldWorker/Maintenance%20Flow/direction.dart';
import 'package:restaurent_app_tek/FieldWorker/Maintenance%20Flow/maintenance_select.dart';
import 'package:restaurent_app_tek/controllers/FieldWorker/maintenance_Controller.dart';

class MaintenancePage extends StatelessWidget {
  final List<Map<String, String>> trees = [
    {"name": "Neem", "id": "T1254", "project": "Thane Drive"},
    {"name": "Mango", "id": "T1254", "project": "Thane Drive"},
    {"name": "Orange", "id": "T1254", "project": "Thane Drive"},
  ];

  final MaintenanceController controller = Get.put(MaintenanceController());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFD3E6E0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              _buildHeader(),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: ListView.builder(
                  itemCount: trees.length,
                  itemBuilder: (context, index) {
                    return _buildTreeCard(screenHeight, index, trees[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: ShapeDecoration(
        color: const Color(0xFF01795D),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.40, color: Color(0xFFD4D4D4)),
          borderRadius: BorderRadius.circular(30),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
         SizedBox(width: 4,),
          Text(
            'Maintenance',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTreeCard(
      double screenHeight, int index, Map<String, String> tree) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.2,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 109,
            top: 12,
            child: Text(
              tree['name']!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 109,
            top: 44,
            child: Text(
              'Tree ID : ${tree['id']}',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 115,
            child: Obx(() {
              bool isSelected =
                  controller.isButtonSelected(index, 'Direction');
              return _buildButton(
                label: 'Direction',
                onPressed: () {
                  controller.toggleButtonState(index, 'Direction');
                  Get.to(()=> DirectionPage());
                }, 
                color: isSelected ? const Color(0xFF01795D) : Colors.white,
                textColor: isSelected ? Colors.white : Colors.black,
              );
            }),
          ),
          Positioned(
            left: 10,
            top: 12,
            child: Image.asset("assets/images/Plant.png", width: 88, height: 80),
          ),
          Positioned(
            left: 109,
            top: 71,
            child: Text(
              'Project name : ${tree['project']}',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            left: 190,
            top: 115,
            child: Obx(() {
              bool isSelected =
                  controller.isButtonSelected(index, 'Maintenance');
              return _buildButton(
                label: 'Maintenance',
                onPressed: () {
                   controller.toggleButtonState(index, 'Maintenance');
                   Get.to(()=> MaintenanceSelectPage());
                },
                   
                color: isSelected ? const Color(0xFF01795D) : Colors.white,
                textColor: isSelected ? Colors.white : Colors.black,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required VoidCallback onPressed,
    required Color color,
    required Color textColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 18),
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFE9E9E9)),
              borderRadius: BorderRadius.circular(4),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
