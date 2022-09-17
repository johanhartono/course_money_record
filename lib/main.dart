import 'package:course_money_record/config/app_color.dart';
import 'package:course_money_record/config/session.dart';
import 'package:course_money_record/data/model/user.dart';
import 'package:course_money_record/presentation/page/auth/login_page.dart';
import 'package:course_money_record/presentation/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:intl/date_symbol_data_local.dart';
//import 'package:window_size/window_size.dart';
//import 'package:window_manager/window_manager.dart';

//References Website : https://blog.codemagic.io/flutter-desktop-apps-intro/
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //For Deskstop Platform only
/*   if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    //setWindowTitle('Flutter Demo');
    setWindowMinSize(const Size(400, 300));
    setWindowMaxSize(Size.infinite);
  } */
  initializeDateFormatting('id_ID').then((value) {
    runApp(const MyApp());
  });
/*     windowManager.waitUntilReadyToShow().then((_) async{
      await windowManager.setAsFrameless();
  }); */
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: AppColor.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primary,
          secondary: AppColor.secondary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.primary,
          foregroundColor: Colors.white,
        ),
      ),
      home: FutureBuilder(
        ///Retrieve session data
        future: Session.getUser(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          if (snapshot.data != null && snapshot.data!.idUser != null) {
            return const HomePage();
          }
          return const LoginPage();
        },
      ),
    );
  }
}
