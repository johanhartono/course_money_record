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

Fix errors:
run inside folder rootproject
git config --global url.https://github.com/.insteadOf git://github.com/
start ms-settings:developers

Alur Kerja Aplikasi:
Back End (menggunakan mysql dan php)
predefined script query my sql create,insert,update,delete

Front End (menggunakan flutter)

0. Setting Data Model Json menggunakan predefined dari web biar cepat
https://app.quicktype.io/

1. Bermula dari Main.dart
Widget FutureBuilder memanggil fungsi Session.getUser() dari folder lib\config\session.dart
session.dart memanggil data model di folder lib\model\user.dart dan passing value ke  controller di folder presentation\controller\c_user.dart

main.dart akan  mengecek session user dan password apakah terisi atau kosong, apabila sudah terisi makan sistem akan mengarahkan ke
halaman homepage.dart apabila tidak maka akan ke halaman login.dart

session.dart =>Menggunakan sharedpreferenes untuk simpan data secara local
c_user.dart = > mengelora perputaran data dalam aplikasi

2. Login.Dart
memanggil lib\data\source\source_user.dart (untuk passing paramater dari textbox UI) , kemudian memanggil lib\api\app_request.dart (post or get pass data json ke backend php)
terakhir memanggil lib\config\session.dart (untuk menyimpan data sementara alias session variabel dari hasil posting)

setelah pengecekan hasil back end retur success maka halaman login.dart akan diahlihkan ke halaman HomePage.dart

app_request.dart => fungsi POST dan GET untuk passing parameter ke web
source_user.dart => mapping data yang diinput di UI tembak ke ke app_request passing ke web

3. HomePage.dart


