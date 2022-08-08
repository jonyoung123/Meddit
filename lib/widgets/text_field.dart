import 'package:flutter/material.dart';
import 'package:meddit/constants.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {this.myController,
      required this.text,
      this.hintText,
      this.iconButton,
      this.obscureText = false,
      this.autovalidateMode,
      this.validator});

  final TextEditingController? myController;
  final String text;
  final AutovalidateMode? autovalidateMode;
  final String? hintText;
  final String? Function(String?)? validator;
  bool obscureText;
  IconButton? iconButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: kEmailStyle,
        ),
        TextFormField(
          obscureText: obscureText,
          validator: validator,
          autovalidateMode: autovalidateMode,
          obscuringCharacter: '•',
          style: const TextStyle(
            color: Colors.black,
          ),
          controller: myController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              //suffixIconConstraints: const BoxConstraints.expand(height: 10),
              //constraints: const BoxConstraints.loose(height: 20),
              suffixIcon: iconButton,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 225, 133, 133),
                    width: 1.0,
                    style: BorderStyle.solid),
              ),
              contentPadding: const EdgeInsets.only(top: 20),
              disabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 49, 47, 47),
                    width: 1.0,
                    style: BorderStyle.solid),
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 225, 133, 133),
                    width: 1.0,
                    style: BorderStyle.solid),
              ),
              hintText: hintText,
              hintStyle: kHintStyle),
        ),
      ],
    );
  }
}
