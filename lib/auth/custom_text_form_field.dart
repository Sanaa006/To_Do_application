import 'package:flutter/material.dart';
import 'package:todo_list_application/My_theme.dart';
typedef myVailed =String? Function(String?);
class CustomTextFormField extends StatelessWidget {
  String label;
  myVailed validetor;
  TextInputType keyboardType;
  TextEditingController controller;
  CustomTextFormField({required this.label,required this.controller,required this.validetor,this.keyboardType=TextInputType.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
      child: TextFormField(
        controller:controller ,
        validator:validetor ,
        keyboardType:keyboardType ,
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: MyTheme.primaryColor,
              width: 2
            ),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: MyTheme.primaryColor,
              width: 2
          ),
        ),
          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: MyTheme.rad,
                width: 2
            ),
          ),
         focusedErrorBorder:   OutlineInputBorder(
           borderRadius: BorderRadius.circular(15),
           borderSide: BorderSide(
               color: MyTheme.rad,
               width: 2
           ),
         ),
      ),
      )
    );
  }
}
