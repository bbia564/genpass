import 'package:get/get.dart';

import 'password_options_logic.dart';

class PasswordOptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordOptionsLogic());
  }
}
