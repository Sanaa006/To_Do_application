//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/My_theme.dart';
import 'package:todo_list_application/auth/custom_text_form_field.dart';
import 'package:todo_list_application/auth/login/login_screen.dart';
import 'package:todo_list_application/provider/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "register_screen";
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigPovider>(context);
    return Stack(children: [
      Container(
        color: provider.themeApp == ThemeMode.light
            ? MyTheme.backgroundColorLight
            : MyTheme.backgroundColorDark,
        child: Image.asset(
          "assets/images/main_background.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(AppLocalizations.of(context)!.create_acount),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25),
                      CustomTextFormField(
                        label: "UserName",
                        controller: controllerName,
                        validetor: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)
                                ?.please_enter_username;
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        label: "Email",
                        controller: controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        validetor: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)
                                ?.please_enter_email;
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return "please validate of Email";
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        label: "Password",
                        controller: controllerPassword,
                        validetor: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)
                                ?.please_enter_password;
                          }
                          if (text.length < 6) {
                            return "Password should be at least 6 chars";
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        label: "Confirm password",
                        controller: controllerConfirmPassword,
                        validetor: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)
                                ?.please_enter_confirm_password;
                          }
                          if (text != controllerPassword.text) {
                            return "confirm Password doesn't match password";
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                          onPressed: () {
                            register();
                          },
                          child:
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(AppLocalizations.of(context)!.create_acount),
                              ),
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )),
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      }, child: Text(AppLocalizations.of(context)!.already_have_an_acount)),
                    ],
                  ))
            ],
          ),
        ),
      ),
    ]);
  }

  void register()async {
    if (formKey.currentState?.validate() == true) {

      // try {
      //   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: controllerEmail.text,
      //     password: controllerPassword.text,
      //   );
      //   print("register seccsful");
      //   print("");
      // } on FirebaseAuthException catch (e) {
      //   if (e.code == 'weak-password') {
      //     print('The password provided is too weak.');
      //   } else if (e.code == 'email-already-in-use') {
      //     print('The account already exists for that email.');
      //   }
      // } catch (e) {
      //   print(e);
      // }
    }

  }
}
