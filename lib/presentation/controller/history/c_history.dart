import 'package:course_money_record/data/model/history.dart';
import 'package:course_money_record/data/source/source_history.dart';
import 'package:get/get.dart';

class CHistory extends GetxController {
  //It makes _loading an observable variable. Which means that whenever the value of
  //that variable changes, that change will be automatically reflected on all places
  //where it's being used. It's like listening to a stream.
  final _loading = false.obs;
  bool get loading => _loading.value;

  final _list = <History>[].obs;
  // ignore: invalid_use_of_protected_member
  List<History> get list => _list.value;

  getList(idUser) async {
    _loading.value = true;
    update();

    _list.value = await SourceHistory.history(idUser);
    update();

    Future.delayed(const Duration(milliseconds: 900), () {
      _loading.value = false;
      update();
    });
  }

  search(idUser, date) async {
    _loading.value = true;
    update();

    _list.value = await SourceHistory.historySearch(idUser, date);
    update();

    Future.delayed(const Duration(milliseconds: 900), () {
      _loading.value = false;
      update();
    });
  }
}
