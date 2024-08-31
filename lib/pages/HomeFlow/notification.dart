import 'package:flutter/material.dart';
import 'package:restaurent_app_tek/widgets/app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppBAR(title: "Notification"),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            'Today',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      NotificationListTile(),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      NotificationListTile(),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      NotificationListTile(),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        children: [
                          Text(
                            'Yesterday',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      NotificationListTile(),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      NotificationListTile(),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      NotificationListTile(),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      NotificationListTile(),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget NotificationListTile() {
  return ListTile(
    leading: Image.asset("assets/images/shopify.png"),
    title: Text(
      'Korem ipsum dolor sit amet, constetur adipiscing elit.',
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    ),
    subtitle: Text(
      '10m ago',
      style: TextStyle(
        color: Color(0xFF717477),
        fontSize: 10,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
