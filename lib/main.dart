import 'package:create_password/db_password/db_password.dart';
import 'package:create_password/pages/password_first/password_first_binding.dart';
import 'package:create_password/pages/password_first/password_first_view.dart';
import 'package:create_password/pages/password_gen/password_gen_binding.dart';
import 'package:create_password/pages/password_gen/password_gen_view.dart';
import 'package:create_password/pages/password_second/copy_records/copy_records_binding.dart';
import 'package:create_password/pages/password_second/copy_records/copy_records_view.dart';
import 'package:create_password/pages/password_second/password_options/password_options_binding.dart';
import 'package:create_password/pages/password_second/password_options/password_options_view.dart';
import 'package:create_password/pages/password_second/password_second_binding.dart';
import 'package:create_password/pages/password_second/password_second_view.dart';
import 'package:create_password/pages/password_tab/password_tab_binding.dart';
import 'package:create_password/pages/password_tab/password_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'db_password/work_toas.dart';

Color primaryColor = const Color(0xff0083fc);
Color bgColor = const Color(0xfff0faff);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync( () => DBPassword().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Pass,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Pass = [
  GetPage(name: '/', page: () => const PasswordGenView(), binding: PasswordGenBinding()),
  GetPage(name: '/tab', page: () => PasswordTabPage(), binding: PasswordTabBinding()),
  GetPage(name: '/password_first', page: () => PasswordFirstPage(), binding: PasswordFirstBinding()),
  GetPage(name: '/password_toast', page: () => const WorkToas()),
  GetPage(name: '/password_second', page: () => PasswordSecondPage(), binding: PasswordSecondBinding()),
  GetPage(name: '/password_options', page: () => PasswordOptionsPage(), binding: PasswordOptionsBinding()),
  GetPage(name: '/copy_records', page: () => CopyRecordsPage(), binding: CopyRecordsBinding()),
];