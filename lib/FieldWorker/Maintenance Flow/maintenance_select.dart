import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MaintenanceSelectPage extends StatefulWidget {
  const MaintenanceSelectPage({super.key});

  @override
  State<MaintenanceSelectPage> createState() => _MaintenanceSelectPageState();
}

class _MaintenanceSelectPageState extends State<MaintenanceSelectPage> {
  final selectedHealth = ''.obs;
  final selectedGrowth = ''.obs;
  final selectedActivities = <String>[].obs;
  final selectedImages = <File>[].obs;

  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      selectedImages.add(File(pickedFile.path));
    }
  }

  bool get isSubmitEnabled {
    return selectedHealth.isNotEmpty &&
        selectedGrowth.isNotEmpty &&
        selectedActivities.isNotEmpty &&
        selectedImages.isNotEmpty;
  }

  DateTime? selectedDate;

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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tree Health',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Obx(() => _buildSelectableButtonRow(
                            options: ['Good', 'Better', 'Sick', 'Worse', 'Bad'],
                            selectedOption: selectedHealth.value,
                            onSelected: (value) {
                              selectedHealth.value = value;
                            },
                          )),
                      SizedBox(height: screenHeight * 0.02),
                      const Text(
                        'Tree Growth',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Obx(() => _buildSelectableButtonRow(
                            options: ['Sapling', 'Half growth', 'Full growth'],
                            selectedOption: selectedGrowth.value,
                            onSelected: (value) {
                              selectedGrowth.value = value;
                            },
                          )),
                      SizedBox(height: screenHeight * 0.02),
                      const Text(
                        'Maintenance activity',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Obx(() => _buildSelectableButtonColumn(
                            options: [
                              'Watering',
                              'Fertilizer',
                              'Pesticides',
                              'Fencing',
                              'Trimming'
                            ],
                            selectedOptions: selectedActivities,
                            onSelected: (value) {
                              if (selectedActivities.contains(value)) {
                                selectedActivities.remove(value);
                              } else {
                                selectedActivities.add(value);
                              }
                            },
                          )),
                      SizedBox(height: screenHeight * 0.02),
                      const Text(
                        'Take photo',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      _buildPhotoPicker(),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Text(
                            'Remarks (Optional)',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Write your remark here',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        children: [
                          Text(
                            'Type your message (Optional)',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Type your message',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        maxLines: 4,
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Obx(
                        () => GestureDetector(
                          onTap: isSubmitEnabled
                              ? () {
                                  _showSuccessDialog(context);
                                }
                              : null,
                          child: Container(
                            width: double.infinity,
                            height: screenHeight * 0.07,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: isSubmitEnabled
                                  ? const Color(0xFF01795D)
                                  : const Color(0xFFB2D2C8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                    ],
                  ),
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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          const SizedBox(width: 4),
          const Text(
            'Neem',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              child: Image.asset("assets/images/calendar_green.png"),
              onTap: () {
                _selectDate(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectableButtonRow({
    required List<String> options,
    required String selectedOption,
    required void Function(String) onSelected,
  }) {
    return Wrap(
      spacing: 8,
      children: options.map((option) {
        final isSelected = selectedOption == option;
        return GestureDetector(
          onTap: () {
            onSelected(option);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              width: 110,
              height: 45,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: ShapeDecoration(
                color: isSelected ? const Color(0xFF01795D) : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Text(
                option,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSelectableButtonColumn({
    required List<String> options,
    required RxList<String> selectedOptions,
    required void Function(String) onSelected,
  }) {
    return Column(
      children: options.map((option) {
        final isSelected = selectedOptions.contains(option);
        return GestureDetector(
          onTap: () => onSelected(option),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            margin: const EdgeInsets.only(bottom: 8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF01795D) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF01795D)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                option,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPhotoPicker() {
    return Obx(() => GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: selectedImages.length +
              1, // +1 to accommodate the "Take photo" widget
          itemBuilder: (context, index) {
            if (index == 0) {
              // "Take photo" widget should always be at index 0
              return GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.camera_alt),
                            title: const Text('Camera'),
                            onTap: () {
                              _pickImage(ImageSource.camera);
                              Get.back();
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Gallery'),
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset("assets/images/camera_icon.png"),
                ),
              );
            } else {
              return Stack(
                children: [
                  Image.file(selectedImages[index - 1], fit: BoxFit.cover),
                  Positioned(
                    right: 7,
                    top: 3,
                    child: InkWell(
                      onTap: () {
                        selectedImages.removeAt(index - 1);
                      },
                      child: Image.asset("assets/images/delete_bin.png"),
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _showSuccessDialog(BuildContext context) {
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40),
              Icon(
                Icons.check_circle,
                color: Color(0xFF01795D),
                size: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Maintenance details\nsubmitted successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 20),
             
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 180,
                  height: 50,
                  padding: const EdgeInsets.only(
                      top: 7, left: 10, right: 9, bottom: 7),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.20000000298023224),
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Back to project',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0.13,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
