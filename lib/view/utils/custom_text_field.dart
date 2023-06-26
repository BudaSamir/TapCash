import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tap_cash/constants/colors_manager.dart';

import '../../constants/styles_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.focusNode,
      required this.onSaved,
      this.validator})
      : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 42,
      child: TextFormField(
        validator: validator,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: onSaved,
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(color: MyColors.mainColor, fontSize: 14,),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.name,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.mainColor, width: 1.5)
          ),

        ),
      ),
    );
  }
}
