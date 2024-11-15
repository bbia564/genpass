import 'package:create_password/db_password/db_password.dart';
import 'package:create_password/db_password/password_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CopyRecordsLogic extends GetxController {

  DBPassword dbPassword = Get.find<DBPassword>();

  var list = <PasswordEntity>[].obs;

  void getData() async {
    list.value = await dbPassword.getPasswordAllData();
  }

  cleanPasswordData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            dbPassword.cleanPasswordData();
            getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  void copyData(PasswordEntity entity) {
    Clipboard.setData(ClipboardData(text: entity.password));
    Fluttertoast.showToast(msg: 'Copy success');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
