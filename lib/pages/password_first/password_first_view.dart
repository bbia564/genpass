import 'package:create_password/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'password_first_logic.dart';

class PasswordFirstPage extends GetView<PasswordFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: <Widget>[
              <Widget>[
                Icon(
                  Icons.adjust,
                  size: 20,
                  color: primaryColor,
                ).marginOnly(right: 10),
                const Text(
                  'Password generation',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )
              ].toRow(),
              Divider(
                height: 50,
                color: Colors.grey[300],
              ),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    child: Obx(() {
                      return Text(
                        controller.password.value,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: primaryColor),
                      );
                    }),
                  ).decorated(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: primaryColor)),
                  Icon(
                    Icons.copy,
                    size: 20,
                    color: primaryColor,
                  ).marginOnly(right: 15).gestures(onTap: () {
                    controller.copyData();
                  })
                ],
              )
            ].toColumn(),
          ).decorated(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: <Widget>[
              <Widget>[
                const Text(
                  'Password length',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  width: 10,
                ),
                Obx(() {
                  return Text(
                    '${controller.passwordLength.value}',
                    style: TextStyle(fontSize: 14, color: primaryColor),
                  );
                }),
              ].toRow(),
              <Widget>[
                const Text(
                  '4',
                  style: TextStyle(fontSize: 14),
                ),
                Expanded(child: Obx(() {
                  return Slider(
                      inactiveColor: Colors.grey[300],
                      activeColor: primaryColor,
                      value: controller.passwordLength.value.toDouble(),
                      min: 4,
                      max: 32,
                      onChanged: (value) {
                        controller.passwordLength(value.toInt());
                      });
                })),
                const Text(
                  '32',
                  style: TextStyle(fontSize: 14),
                )
              ].toRow()
            ].toColumn(),
          ).decorated(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            child: const Text(
              'Generate password',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
              .decorated(
                  color: primaryColor, borderRadius: BorderRadius.circular(25))
              .marginOnly(top: 20)
              .gestures(onTap: () {
                controller.createPassword();
          })
        ].toColumn(),
      ).marginAll(15)),
    ));
  }
}
