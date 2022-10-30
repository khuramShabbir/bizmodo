import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final String title;
  final TextEditingController? textCtrl;
  final bool obSecure;
  final FormFieldValidator<String>? validator;

  EntryField({this.validator, this.obSecure = false, this.title = "", required this.textCtrl});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textCtrl,
      obscureText: obSecure,
      decoration: InputDecoration(
          prefixStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          hintText: title,
          hintStyle:
              Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black, fontSize: 17)),
    );
  }
}
