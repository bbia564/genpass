import 'package:get/get.dart';

import 'password_gen_logic.dart';

class PasswordGenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
