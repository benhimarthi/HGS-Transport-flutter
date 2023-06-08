import 'dart:io';

import 'package:chatty/helper/galeryImage.dart';
import 'package:chatty/helper/helper_function.dart';
import 'package:chatty/pages/auth/login_page.dart';
import 'package:chatty/service/auth_service.dart';
import 'package:chatty/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'UserProfile.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  late File _image;
  AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _image = File("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "HGS-Transport",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Create your account now to have acess to our services",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5,
                                      color: const Color.fromARGB(
                                          255, 53, 181, 222)),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(60),
                                  )),
                              child: CircleAvatar(
                                radius: 55,
                                child: _image.path != ""
                                    ? ClipOval(
                                        child: Image.file(
                                          _image,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : ClipOval(
                                        child: Image.asset(
                                          "assets/images/ml.png",
                                          fit: BoxFit.fill,
                                          scale: 50,
                                        ),
                                      ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    var picekdImg = ImageSelect.getImage();
                                    setState(() {});
                                    picekdImg.then((value) {
                                      _image = File(value!.path);
                                      setState(() {});
                                      //print("The path is :" + value!.path);
                                    });
                                  });
                                },
                                icon: const Icon(Icons.camera_alt))
                          ],
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "Full name",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).primaryColor,
                              )),
                          onChanged: (value) {
                            setState(() {
                              fullName = value;
                            });
                          },
                          //check validation
                          validator: (val) {
                            if (val!.isNotEmpty) {
                              return null;
                            } else {
                              return "Name can not be empty!";
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: "Email",
                              prefixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).primaryColor,
                              )),
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          //check validation
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val!)
                                ? null
                                : "Please enter a valid email";
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          obscureText: true,
                          decoration: textInputDecoration.copyWith(
                              labelText: "Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColor,
                              )),
                          validator: (val) {
                            if (val!.length < 6) {
                              return "Password must be at least 6 characters";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(double.infinity, 45),
                                  primary: Theme.of(context).primaryColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: (() {
                                register();
                              }),
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                            text: "Already have an account?",
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Login now",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      nextScreen(context, const LoginPage());
                                    }),
                            ],
                            style: const TextStyle(
                                color: Color.fromARGB(255, 46, 46, 46),
                                fontSize: 14)))
                      ]),
                ),
              ),
            ),
    );
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
    }
    await authService
        .registerUserWithEmailAndPassword(fullName, email, password, _image)
        .then((value) async {
      if (value == true) {
        //saving the shared preference state
        await HelperFunction.saveUserLoggedInStatus(true);
        await HelperFunction.saveUserEmailSF(email);
        await HelperFunction.saveUserNameSF(fullName);
        HelperFunction.userInformations.name = fullName;
        HelperFunction.userInformations.mailAddress = email;
        HelperFunction.userInformations.imageLink = _image.path.split('/').last;
        HelperFunction.userInformations.mode = 0;
        HelperFunction.userInformations.uid =
            FirebaseAuth.instance.currentUser!.uid;
        nextScreenReplace(context, const UserProfile());
      } else {
        showSnackbar(context, Colors.red, value);
        setState(() {
          _isLoading = false;
        });
      }
    });
  }
}
