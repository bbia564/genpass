import 'package:get/get.dart';

import 'password_first_logic.dart';

class PasswordFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordFirstLogic());
  }
}
