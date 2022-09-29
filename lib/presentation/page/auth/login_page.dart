import 'package:flutter/material.dart';
import 'package:get/get.dart';
//
import 'package:course_money_record/config/app_asset.dart';
import 'package:course_money_record/config/app_color.dart';
import 'package:course_money_record/data/source/source_user.dart';
import 'package:course_money_record/presentation/page/auth/register_page.dart';
import 'package:course_money_record/presentation/page/home_page.dart';
import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';

//-----------Code by default jangan diganggu--------------------------------
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
//-----------Code by default jangan diganggu--------------------------------

class _LoginPageState extends State<LoginPage> {
  //Definisikan Variable - Mapping UI Text to Controller
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //Login Function
  login() async {
    //To make apps secure and easy to use, check whether the information the user has
    //provided is valid. If the user has correctly filled out the form, process the information.
    //If the user submits incorrect information, display a friendly error message letting them
    //know what went wrong
    if (formKey.currentState!.validate()) {
      //-----------------------Passing ke source_user.date--------------------------------------
      bool success = await SourceUser.login(
        controllerEmail.text,
        controllerPassword.text,
      );
      //-----------------------Passing ke source_user.date--------------------------------------
      
      if (success) {
        DInfo.dialogSuccess('Berhasil Login');
        DInfo.closeDialog(actionAfterClose: () {
          Get.off(() => const HomePage());
        });
      } else {
        DInfo.dialogError('Gagal Login');
        DInfo.closeDialog();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      //Layout Builder auto adjust size of screen or means Responsive
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            //supaya tampilan tidak terputus
            child: ConstrainedBox(
              //prevent Soft keyboard overwhelming
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DView.nothing(),
                  //-------------------------------Form--------------------------------------
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          //-------------------------------Logo------------------------------
                          Image.asset(AppAsset.logo),
                          //-------------------------------Logo------------------------------
                          DView.spaceHeight(40),
                          //-------------------------------Email-----------------------------
                          TextFormField(
                            controller: controllerEmail,
                            validator: (value) =>
                                value == '' ? 'Jangan kosong' : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: AppColor.primary.withOpacity(0.5),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'email',
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                            ),
                          ),
                          //-------------------------------Email-----------------------------
                          DView.spaceHeight(),
                          //-------------------------------Password--------------------------
                          TextFormField(
                            controller: controllerPassword,
                            validator: (value) =>
                                value == '' ? 'Jangan kosong' : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: true,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: AppColor.primary.withOpacity(0.5),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'password',
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                            ),
                          ),
                          //-------------------------------Password--------------------------
                          DView.spaceHeight(30),
                          //-------------------------------Button Login----------------------
                          Material(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(30),
                            child: InkWell(
                              onTap: () => login(),
                              borderRadius: BorderRadius.circular(30),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 16),
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //-------------------------------Button Login----------------------
                        ],
                      ),
                    ),
                  ),
                  //-------------------------------Form--------------------------------------

                  //---------------------Belum Punya Akun?Register---------------------------
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //-----------------------Belum Punya Akun---------------------------
                        const Text(
                          'Belum punya akun? ',
                          style: TextStyle(fontSize: 16),
                        ),
                        //-----------------------Belum Punya Akun---------------------------
                        //-----------------------Register-----------------------------------
                        //dapat dipelajari di https://api.flutter.dev/flutter/widgets/widgets-library.html
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const RegisterPage());
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        //-----------------------Register------------------------------------
                      ],
                    ),
                  ),
                  //---------------------Belum Punya Akun?Register---------------------------
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
