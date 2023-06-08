import 'package:chatty/pages/search_page.dart';
import 'package:chatty/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  String placeholder;
  String defaultValue;
  Icon prefixIcon;
  Icon sufixIcon;
  bool isPassword;
  dynamic validator;
  dynamic onChange;
  TextInput(
      {super.key,
      required this.placeholder,
      required this.prefixIcon,
      required this.sufixIcon,
      required this.isPassword,
      required this.validator,
      required this.onChange,
      required this.defaultValue});

  @override
  State<TextInput> createState() => _TextInputState(placeholder, prefixIcon,
      sufixIcon, isPassword, validator, onChange, defaultValue);
}

class _TextInputState extends State<TextInput> {
  String placeholder = "";
  String defaultValue = "";
  Icon prefixIcon;
  Icon sufixIcon;
  bool isPassword;
  dynamic validator;
  dynamic onChange;
  _TextInputState(this.placeholder, this.prefixIcon, this.sufixIcon,
      this.isPassword, this.validator, this.onChange, this.defaultValue);

  @override
  Widget build(BuildContext context) {
    return isPassword
        ? Container(
            width: MediaQuery.of(context).size.width * .8,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 239, 239, 239),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: TextFormField(
                  initialValue: defaultValue,
                  obscureText: true,
                  validator: validator,
                  onChanged: onChange,
                  decoration: InputDecoration(
                    hintText: placeholder,
                    border: InputBorder.none,
                    prefixIcon: prefixIcon,
                    suffixIcon: sufixIcon,
                  )),
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width * .8,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 239, 239, 239),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: TextFormField(
                  onTap: () {
                    //nextScreen(context, const Search());
                  },
                  validator: validator,
                  onChanged: onChange,
                  decoration: InputDecoration(
                    hintText: placeholder,
                    border: InputBorder.none,
                    prefixIcon: prefixIcon,
                  )),
            ),
          );
  }
}
