# course_money_record

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Alur Kerja Aplikasi:
Back End (menggunakan mysql dan php)
predefined script query my sql create,insert,update,delete

Front End (menggunakan flutter)
0. Setting Data Model Json menggunakan web biar cepat
https://app.quicktype.io/

1. Bermula dari Main.dart
Widget FutureBuilder memanggil fungsi Session.getUser() dari folder lib\config\session.dart
session.dart memanggil data model di folder lib\model\user.dart dan passin value ke  controller di folder presentation\controller\c_user.dart

main.dart akan  mengecek session user dan password apakah terisi atau kosong, apabila terisi makan sistem akan mengarahkan ke
halaman homepage.dart apabila tidak maka akan ke halaman login.dart

2.

