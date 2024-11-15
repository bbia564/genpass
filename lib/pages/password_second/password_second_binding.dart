import 'package:get/get.dart';

import 'password_second_logic.dart';

class PasswordSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordSecondLogic());
  }
}
