import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../presentation/controller/c_user.dart';
import 'package:course_money_record/data/model/user.dart';

//shared preferences  artinya penyimpanan data secara lokal/atau disebut dengan
//temporary table

//Session.dart dipanggil saat main.dart dijalankan menggunakan widget Futurebulider
//session.getUser()
class Session {
  //1. Berfungsi untuk menyimpan sesi user saat login.dart
  static Future<bool> saveUser(User user) async {
    final pref = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String stringUser = jsonEncode(mapUser);
    bool success = await pref.setString('user', stringUser);
    //GetX State Management, dimana data ditampung sementara di state kemudian bisa dipakai hampir di seluruh Front End
    if (success) {
      final cUser = Get.put(CUser());
      cUser.setData(user);
    }
    return success;
  }

  //2. Berfungsi untuk memanggil sesi user yang sudah tersimpan terus mengecek
  //status login apabila belum ada makan akan diarahkan ke halaman login
  static Future<User> getUser() async {
    User user = User(); // default value
    final pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('user');
    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      user = User.fromJson(mapUser);
    }
    final cUser = Get.put(CUser());
    cUser.setData(user);
    return user;
  }

//3. Berfungsi untuk mereset sesi user yang tersimpan saat logout
  static Future<bool> clearUser() async {
    final pref = await SharedPreferences.getInstance();
    bool success = await pref.remove('user');
    final cUser = Get.put(CUser());
    cUser.setData(User());
    return success;
  }
}
