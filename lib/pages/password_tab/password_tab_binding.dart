import 'package:get/get.dart';

import '../password_first/password_first_logic.dart';
import '../password_second/password_second_logic.dart';
import 'password_tab_logic.dart';

class PasswordTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordTabLogic());
    Get.lazyPut(() => PasswordFirstLogic());
    Get.lazyPut(() => PasswordSecondLogic());
  }
}
