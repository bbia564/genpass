import 'package:get/get.dart';

import 'copy_records_logic.dart';

class CopyRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CopyRecordsLogic());
  }
}
