import 'package:get/get.dart';

class MaintenanceController extends GetxController {
  var selectedButtonIndex = <int, bool>{}.obs;

  void toggleButtonState(int index, String buttonType) {
    int key = buttonType == 'Direction' ? index : index + 1000;
    selectedButtonIndex[key] = !(selectedButtonIndex[key] ?? false);
  }

  bool isButtonSelected(int index, String buttonType) {
    int key = buttonType == 'Direction' ? index : index + 1000;
    return selectedButtonIndex[key] ?? false;
  }
}
