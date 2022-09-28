import 'dart:convert';

import 'package:course_money_record/data/source/source_history.dart';
import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../config/app_color.dart';
import '../../../config/app_format.dart';
import '../../controller/c_user.dart';
import '../../controller/history/c_add_history.dart';

class AddHistoryPage extends StatelessWidget {
  AddHistoryPage({Key? key}) : super(key: key);
  final cAddHistory = Get.put(CAddHistory());
  final cUser = Get.put(CUser());
  //
  final controllerName = TextEditingController();
  final controllerPrice = TextEditingController();

  //----------------Function Add History Data--------------------------------
  addHistory() async {
    bool success = await SourceHistory.add(
      cUser.data.idUser!,
      cAddHistory.date,
      cAddHistory.type,
      jsonEncode(cAddHistory.items),
      cAddHistory.total.toString(),
    );
    if (success) {
      //----------------Fungsi Delayed--------------------------------------
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.back(result: true);
      });
      //----------------Fungsi Delayed--------------------------------------
    }
  }
  //----------------Function Add History Data--------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //----------------Title/App Bar--------------------------------------
      appBar: DView.appBarLeft('Tambah Baru'),
      //----------------Title/App Bar---------------------------------------

      //---------------- Entire Body ListView----------------------------------
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          //---------------- Date Selection----------------------------------
          const Text(
            'Tanggal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Obx(() {
                return Text(cAddHistory.date);
              }),
              DView.spaceWidth(),
              ElevatedButton.icon(
                onPressed: () async {
                  DateTime? result = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022, 01, 01),
                    lastDate: DateTime(DateTime.now().year + 1),
                  );
                  if (result != null) {
                    //---------------- Isikan value date ke controller----------
                    cAddHistory
                        .setDate(DateFormat('yyyy-MM-dd').format(result));
                    //---------------- Isikan value date ke controller----------
                  }
                },
                icon: const Icon(Icons.event),
                label: const Text('Pilih'),
              ),
            ],
          ),
          //---------------- Date Selection----------------------------------
          DView.spaceHeight(),
          //---------------- Date Selection----------------------------------
          //---------------- Combo Tipe transaksi----------------------------
          const Text(
            'Tipe',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          DView.spaceHeight(4),
          Obx(() {
            return DropdownButtonFormField(
              value: cAddHistory.type,
              items: ['Pemasukan', 'Pengeluaran'].map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (value) {
                cAddHistory.setType(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
              ),
            );
          }),
          //---------------- Combo Tipe transaksi----------------------------
          DView.spaceHeight(),
          //---------------- Input Text Sumber/Jualan -----------------------
          DInput(
            controller: controllerName,
            hint: 'Jualan',
            title: 'Sumber/Objek Pengeluaran',
          ),
          DView.spaceHeight(),
          //---------------- Input Text Sumber/Jualan -----------------------
          DInput(
            controller: controllerPrice,
            hint: '30000',
            title: 'Harga',
            inputType: TextInputType.number,
          ),
          //---------------- Input Text Sumber/Jualan -----------------------
          DView.spaceHeight(),
          //---------------- Button Tambah Items------ -----------------------
          ElevatedButton(
            onPressed: () {
              cAddHistory.addItem({
                'name': controllerName.text,
                'price': controllerPrice.text,
              });
              controllerName.clear();
              controllerPrice.clear();
            },
            child: const Text('Tambah ke Items'),
          ),
          //---------------- Button Tambah Items------ -----------------------
          DView.spaceHeight(),
          //---------------- Dekorasi pemisah --------- -----------------------
          Center(
            child: Container(
              height: 5,
              width: 80,
              decoration: BoxDecoration(
                color: AppColor.bg,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          //---------------- Dekorasi emusah --------- -----------------------
          DView.spaceHeight(),
          //---------------- Listing added Items------ -----------------------
          const Text(
            'Items',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          DView.spaceHeight(8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: GetBuilder<CAddHistory>(builder: (_) {
              return Wrap(
                runSpacing: 0,
                spacing: 8,
                children: List.generate(_.items.length, (index) {
                  return Chip(
                    label: Text(_.items[index]['name']),
                    deleteIcon: const Icon(Icons.clear),
                    onDeleted: () => _.deleteItem(index),
                  );
                }),
              );
            }),
          ),
          //---------------- Listing added Items------ -----------------------
          DView.spaceHeight(),
          //---------------- Total Harga--------------------------------------
          Row(
            children: [
              const Text(
                'Total:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DView.spaceWidth(8),
              Obx(() {
                return Text(
                  AppFormat.currency(cAddHistory.total.toString()),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary,
                      ),
                );
              }),
            ],
          ),
          //---------------- Total Harga--------------------------------------
          DView.spaceHeight(30),
          //---------------- Tombol Submit-------------------------------------
          Material(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () => addHistory(),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    'SUBMIT',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          )
          //---------------- Tombol Submit-------------------------------------
        ],
      ),
      //---------------- Entire Body ListView----------------------------------
    );
  }
}
