import 'package:course_money_record/data/model/user.dart';
import 'package:get/get.dart';

// class CUser sebenarnya adalah contoh dari getter dan setter
//mengcopy data dari data model kemudian di set value ke CUSer.data
//ibaratanya menpassing data page antar page

class CUser extends GetxController {
  //---------------------------------------------------------------------------
  final _data = User().obs;
  User get data => _data.value;
  setData(n) => _data.value = n;
  //---------------------------------------------------------------------------
}
