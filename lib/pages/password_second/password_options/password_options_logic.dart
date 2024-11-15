import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordOptionsLogic extends GetxController {

  var upValue = true.obs;
  var downValue = true.obs;
  var numValue = true.obs;
  var symbolValue = true.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    upValue.value = prefs.getBool('upValue') ?? true;
    downValue.value = prefs.getBool('downValue') ?? true;
    numValue.value = prefs.getBool('numValue') ?? true;
    symbolValue.value = prefs.getBool('symbolValue') ?? true;
    super.onInit();
  }

}
