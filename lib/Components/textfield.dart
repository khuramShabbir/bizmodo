import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final String title;
  final TextEditingController? textCtrl;
  final bool obSecure;
  final FormFieldValidator<String>? validator;
  final isOutLined;

  EntryField({
    this.isOutLined = false,
    this.validator,
    this.obSecure = false,
    this.title = "",
    required this.textCtrl,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textCtrl,
      obscureText: obSecure,
      decoration: InputDecoration(
          prefixStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black),
          border: isOutLined
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 1.5))
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
          enabledBorder: isOutLined
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 1.5))
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
          focusedBorder: isOutLined
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 1.5))
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
          hintText: title,
          hintStyle:
              Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black, fontSize: 17)),
    );
  }
}
