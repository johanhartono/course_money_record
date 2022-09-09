import 'package:course_money_record/config/api.dart';
import 'package:course_money_record/config/app_request.dart';
import 'package:course_money_record/config/session.dart';
import '../model/user.dart';

import 'package:d_info/d_info.dart';

//fungsi class SourceUser adalah untuk mengirimakan paramater ke php backend
class SourceUser {
  static Future<bool> login(String email, String password) async {
    String url = '${Api.user}/login.php';
    Map? responseBody = await AppRequest.post(url, {
      'email': email,
      'password': password,
    });

    if (responseBody == null) {
      return false;
    } else if (responseBody['success']) {
      var mapUser = responseBody['data'];
      Session.saveUser(User.fromJson(mapUser));
    }

    return responseBody['success'];
  }

  static Future<bool> register(
      String name, String email, String password) async {
    String url = '${Api.user}/register.php';
    Map? responseBody = await AppRequest.post(url, {
      'name': name,
      'email': email,
      'password': password,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    });

    if (responseBody == null) {
      return false;
    } else if (responseBody['success']) {
      DInfo.dialogSuccess('Berhasil Register');
      DInfo.closeDialog();
    } else {
      if (responseBody['message'] == 'email') {
        DInfo.dialogError('Email sudah terdaftar');
      } else {
        DInfo.dialogError('Gagal Register');
      }
      DInfo.closeDialog();
    }

    return responseBody['success'];
  }
}
