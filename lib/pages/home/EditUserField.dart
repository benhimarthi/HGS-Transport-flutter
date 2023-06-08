import 'package:chatty/helper/helper_function.dart';
import 'package:chatty/service/database_service.dart';
import 'package:flutter/material.dart';

class EditUserField extends StatefulWidget {
  String defaultTitle;
  String fieldValue;
  String db_field;
  Icon leading;
  Icon trailing;
  bool isPassword;

  EditUserField({
    super.key,
    required this.isPassword,
    required this.defaultTitle,
    required this.fieldValue,
    required this.leading,
    required this.db_field,
    required this.trailing,
  });

  @override
  State<EditUserField> createState() => _EditUserFieldState(
      defaultTitle, fieldValue, trailing, leading, isPassword);
}

class _EditUserFieldState extends State<EditUserField> {
  String defaultTitle = "";
  String fieldValue = "";
  Icon trailing = const Icon(Icons.abc);
  Icon leading = const Icon(Icons.abc);
  bool isPassword = false;
  late DatabaseService databaseService;

  _EditUserFieldState(this.defaultTitle, this.fieldValue, this.leading,
      this.trailing, this.isPassword);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseService = DatabaseService(uid: HelperFunction.userInformations.uid);
  }

  bool showValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 220, 237, 243),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, .9), blurRadius: 1.2, color: Colors.grey)
          ],
          /*border: Border.all(
              color: const Color.fromARGB(255, 53, 181, 222),
              width: 2),*/
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                showValue = showValue ? false : true;
              });
            },
            child: ListTile(
                title: Text(
                  !showValue ? fieldValue : defaultTitle,
                  style: const TextStyle(
                      //fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 53, 181, 222)),
                ),
                leading: leading,
                trailing: showValue
                    ? const Icon(
                        Icons.close,
                        color: Colors.red,
                      )
                    : trailing),
          ),
          Visibility(
              visible: showValue,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    height: 40,
                    decoration: const BoxDecoration(
                        color:
                            Colors.white, //Color.fromARGB(255, 221, 221, 221),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            fieldValue = value;
                          });
                        },
                        textAlign: TextAlign.center,
                        obscureText: isPassword,
                        initialValue: fieldValue,
                        decoration: InputDecoration(
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.normal),
                            border: InputBorder.none,
                            hintText: defaultTitle),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        databaseService.updateValueInTable(
                            HelperFunction.userInformations.uid,
                            widget.db_field,
                            fieldValue);
                        switch (defaultTitle) {
                          case "Full name":
                            HelperFunction.userInformations.name = fieldValue;
                            break;
                          case "Mail address":
                            HelperFunction.userInformations.mailAddress =
                                fieldValue;
                            break;
                          case "Password":
                            HelperFunction.userInformations.password =
                                fieldValue;
                            break;
                        }
                        setState(() {});
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Color.fromARGB(255, 53, 181, 222)),
                        child: const Text(
                          "Apply modification",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
