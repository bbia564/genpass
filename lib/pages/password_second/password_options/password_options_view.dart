import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

import 'password_options_logic.dart';

class PasswordOptionsPage extends GetView<PasswordOptionsLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Options'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    Container(
                      color: Colors.transparent,
                      height: 40,
                      child: <Widget>[
                        const Text('Include uppercase'),
                        Obx(() {
                          return Switch(value: controller.upValue.value,
                              activeTrackColor: Colors.green,
                              onChanged: (value) async {
                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                final downValue = prefs.getBool('downValue') ?? true;
                                final numValue = prefs.getBool('numValue') ?? true;
                                final symbolValue = prefs.getBool('symbolValue') ?? true;
                                if (!downValue && !numValue && !symbolValue && !value) {
                                  Fluttertoast.showToast(msg: ' At least one character type exists');
                                  return;
                                }
                                await prefs.setBool('upValue', value);
                                controller.upValue.value = value;
                              });
                        })
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: 40,
                      child: <Widget>[
                        const Text('Include lowercase'),
                        Obx(() {
                          return Switch(value: controller.downValue.value,
                              activeTrackColor: Colors.green,
                              onChanged: (value) async {
                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                final upValue = prefs.getBool('upValue') ?? true;
                                final numValue = prefs.getBool('numValue') ?? true;
                                final symbolValue = prefs.getBool('symbolValue') ?? true;
                                if (!upValue && !numValue && !symbolValue && !value) {
                                  Fluttertoast.showToast(msg: ' At least one character type exists');
                                  return;
                                }
                                await prefs.setBool('downValue', value);
                                controller.downValue.value = value;
                              });
                        })
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: 40,
                      child: <Widget>[
                        const Text('Inclusion digit'),
                        Obx(() {
                          return Switch(value: controller.numValue.value,
                              activeTrackColor: Colors.green,
                              onChanged: (value) async {
                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                final downValue = prefs.getBool('downValue') ?? true;
                                final upValue = prefs.getBool('upValue') ?? true;
                                final symbolValue = prefs.getBool('symbolValue') ?? true;
                                if (!downValue && !upValue && !symbolValue && !value) {
                                  Fluttertoast.showToast(msg: ' At least one character type exists');
                                  return;
                                }
                                await prefs.setBool('numValue', value);
                                controller.numValue.value = value;
                              });
                        })
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: 40,
                      child: <Widget>[
                        const Text('Inclusion symbol'),
                        Obx(() {
                          return Switch(value: controller.symbolValue.value,
                              activeTrackColor: Colors.green,
                              onChanged: (value) async {
                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                final downValue = prefs.getBool('downValue') ?? true;
                                final numValue = prefs.getBool('numValue') ?? true;
                                final upValue = prefs.getBool('upValue') ?? true;
                                if (!downValue && !numValue && !upValue && !value) {
                                  Fluttertoast.showToast(msg: ' At least one character type exists');
                                  return;
                                }
                                await prefs.setBool('symbolValue', value);
                                controller.symbolValue.value = value;
                              });
                        })
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                    )
                  ].toColumn(
                      separator: Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      )),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12))
              ].toColumn(),
            ).marginAll(15)),
      ),
    );
  }
}
