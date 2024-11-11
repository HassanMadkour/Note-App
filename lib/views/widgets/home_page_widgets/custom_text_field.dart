import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.maxLines,
    this.hintText,
    this.onSaved,
    this.onChange,
  });
  final int? maxLines;
  final String? hintText;
  final void Function(String? value)? onSaved;
  final void Function(String? value)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChange,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "U must fill the field";
          } else {
            return null;
          }
        },
        onSaved: onSaved,
        maxLines: maxLines,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: kPrimaryColor),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(5))));
  }
}
