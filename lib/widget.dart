import 'package:flutter/material.dart';
import 'package:myform/function.dart';
import 'package:myform/variables.dart';

class TextInputWidget extends StatefulWidget {
  final TextEditingController control;

  final String hintText;
  final Widget labelWidget;
  final Widget prefixIcn;
  const TextInputWidget({
    super.key,
    required this.control,
    required this.hintText,
    required this.labelWidget,
    required this.prefixIcn,
  });

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.control,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        label: widget.labelWidget,
        prefixIcon: widget.prefixIcn,

        // suffixIcon: ,
        border: OutlineInputBorder(borderSide: BorderSide(width: 1.0)),
      ),
      validator: (value) => validateForm(value!, widget.hintText),
    );
  }
}

class PasswordWidget extends TextInputWidget {
  // final Widget suffixIcn;

  const PasswordWidget({
    super.key,
    required super.control,
    required super.labelWidget,
    required super.hintText,
    required super.prefixIcn,
    // required this.suffixIcn,
  });

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hide,
      controller: widget.control,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        label: widget.labelWidget,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              hide = !hide;
            });
          },
          icon:
              hide
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off_outlined),
        ),
        prefixIcon: widget.prefixIcn,

        // suffixIcon: ,
        border: OutlineInputBorder(borderSide: BorderSide(width: 1.0)),
      ),
      validator: (value) => validateForm(value!, widget.hintText),
    );
  }
}
