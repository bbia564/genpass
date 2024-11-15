import 'dart:ffi';

import 'package:create_password/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'copy_records_logic.dart';

class CopyRecordsPage extends GetView<CopyRecordsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Copy records'),
        backgroundColor: Colors.white,
        actions: [
          Icon(
            Icons.delete,
            size: 30,
            color: primaryColor,
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.cleanPasswordData();
          })
        ],
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Obx(() {
          return controller.list.value.isEmpty
              ? const Center(child: Text('No data'))
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.list.value.length,
                  itemBuilder: (_, index) {
                    final entity = controller.list.value[index];
                    return <Widget>[
                      <Widget>[
                        Expanded(
                            child: Text(
                          entity.password,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.copy,
                          size: 20,
                          color: primaryColor,
                        ).gestures(onTap: () {
                          controller.copyData(entity);
                        })
                      ].toRow(),
                      Divider(
                        height: 25,
                        color: Colors.grey[300],
                      )
                    ].toColumn();
                  });
        }),
      )
              .decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(20))
              .marginAll(15)),
    );
  }
}
