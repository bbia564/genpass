import 'dart:math';

import 'package:create_password/db_password/db_password.dart';
import 'package:create_password/db_password/password_entity.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordFirstLogic extends GetxController {
  DBPassword dbPassword = Get.find<DBPassword>();

  var password = '-'.obs;
  var passwordLength = 16.obs;

  String generatePassword(int length,
      {bool includeUpper = false,
      bool includeLower = false,
      bool includeDigits = false,
      bool includeSymbols = false}) {
    if (length < 4 || length > 32) {
      throw ArgumentError('Password length must be between 4 and 32.');
    }

    const String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String lower = 'abcdefghijklmnopqrstuvwxyz';
    const String digits = '0123456789';
    const String symbols = '!@#\$%^&*()-_=+[]{}|;:,.<>?';

    String allChars = '';
    if (includeUpper) allChars += upper;
    if (includeLower) allChars += lower;
    if (includeDigits) allChars += digits;
    if (includeSymbols) allChars += symbols;

    if (allChars.isEmpty) {
      throw ArgumentError('At least one character type must be selected.');
    }

    Random random = Random();
    String password = '';

    if (includeUpper) password += upper[random.nextInt(upper.length)];
    if (includeLower) password += lower[random.nextInt(lower.length)];
    if (includeDigits) password += digits[random.nextInt(digits.length)];
    if (includeSymbols) password += symbols[random.nextInt(symbols.length)];

    for (int i = password.length; i < length; i++) {
      password += allChars[random.nextInt(allChars.length)];
    }

    return String.fromCharCodes(password.runes.toList()..shuffle(random));
  }

  void createPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final upValue = prefs.getBool('upValue') ?? true;
    final downValue = prefs.getBool('downValue') ?? true;
    final numValue = prefs.getBool('numValue') ?? true;
    final symbolValue = prefs.getBool('symbolValue') ?? true;
    password.value = generatePassword(passwordLength.value,
        includeUpper: upValue,
        includeLower: downValue,
        includeDigits: numValue,
        includeSymbols: symbolValue);
  }

  void copyData() async {
    Clipboard.setData(ClipboardData(text: password.value));
    Fluttertoast.showToast(msg: 'Copy success');
    final entity = PasswordEntity(
        id: 0, createTime: DateTime.now(), password: password.value);
    await dbPassword.insertPassword(entity);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    createPassword();
    super.onInit();
  }
}
