import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/My_theme.dart';
import 'package:todo_list_application/auth/custom_text_form_field.dart';
import 'package:todo_list_application/auth/register/register_screen.dart';
import 'package:todo_list_application/provider/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LoginScreen extends StatelessWidget {
  static const String routeName="login_screen";
  TextEditingController controllerEmail=TextEditingController();
  TextEditingController controllerPassword=TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigPovider>(context);
    return Stack(
      children:[
        Container(
          color: provider.themeApp==ThemeMode.light? MyTheme.backgroundColorLight:MyTheme.backgroundColorDark,
          child: Image.asset("assets/images/main_background.png",width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(AppLocalizations.of(context)!.login),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(

              children: [
                Form(
                  key:formKey ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                          child: Text(AppLocalizations.of(context)!.welcome_back,style: Theme.of(context).textTheme.labelLarge,),
                        ),
                        CustomTextFormField(label: "Email",controller: controllerEmail,keyboardType: TextInputType.emailAddress,validetor:(text){
                          if(text==null || text.isEmpty){
                            return AppLocalizations.of(context)?.please_enter_email;
                          }
                          bool emailValid =
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if(!emailValid){
                            return "please validate of Email";
                          }
                          return null;
                        },),
                        CustomTextFormField(label: "Password",controller: controllerPassword,validetor:(text){
                          if(text==null || text.isEmpty){
                            return AppLocalizations.of(context)?.please_enter_password;
                          }
                          if(text.length<6){
                            return "Password should be at least 6 chars";
                          }
                          return null;
                        },),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                          child: ElevatedButton(onPressed: (){
                            login();
                          }, child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(AppLocalizations.of(context)!.login),
                          ),style: ButtonStyle(shape: MaterialStatePropertyAll<RoundedRectangleBorder>( RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                          )),
                          ),
                          ),
                        ),
                        TextButton(onPressed: (){
                          Navigator.of(context).pushNamed(RegisterScreen.routeName);
                        }, child: Text(AppLocalizations.of(context)!.or_create_acount))
                      ],
                )
                )
              ],
            ),
          ),
        ),

      ]
    );
  }
  void login(){
    if(formKey.currentState?.validate()==true){}
    //register

  }
}
