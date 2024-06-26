import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/models/register_response/RegisterResponse.dart';
import 'package:graduation/screens/login/buttons.dart';
import 'package:graduation/screens/login/text_ff.dart';
import '../../core/shared_preference.dart';
import '../../layouts/homelayout/homelayout.dart';
import '../login/login_page.dart';
import 'package:http/http.dart' as http;

import '../splash/splashscreen.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = "register";

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailControl = TextEditingController();
  TextEditingController passControl = TextEditingController();
  TextEditingController nameControl = TextEditingController();
  TextEditingController coPassControl = TextEditingController();
  Future<RegisterResponse> register(
      String email, String password, String name) async {
    String? token = await Preference.getToken();
    var response = await http.post(
        Uri.parse("http://secondspin.xyz/api/auth/register"),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(<String, dynamic>{
          "password": password,
          "email": email,
          "name": name
        }));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(response.body);
      var registerResponse = RegisterResponse.fromJson(result);
      Preference.saveToken(registerResponse.data?.token);
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeLayout.routeName,
        ModalRoute.withName(Splashscreen.routeName),
      );
    }
    final result = jsonDecode(response.body);
    print(response.body);
    var registerResponse = RegisterResponse.fromJson(result);
    return registerResponse;
  }

  var formKey = GlobalKey<FormState>();
  bool isVisible = false;
  bool isSeen = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image/auth_bg.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Text(
                    "Create account",
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text("User name", style: theme.textTheme.labelMedium),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextF(
                    hint: "Cody Fisher",
                    asterisk: false,
                    textEditingController: nameControl,
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter user name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text("Email", style: theme.textTheme.labelMedium),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextF(
                    hint: "alma.lawson@example.com",
                    asterisk: false,
                    textEditingController: emailControl,
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your E-mail address";
                      }
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regex.hasMatch(value)) {
                        return "Invalid E-mail address";
                      }
                      return null;
                    },
                    // onSaved: (mail) {
                    //   mail = emailControl.text;
                    // },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text("Password", style: theme.textTheme.labelMedium),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextF(
                    hint: "*************",
                    asterisk: !isVisible,
                    icon: IconButton(
                        onPressed: () {
                          isVisible = !isVisible;
                          setState(() {});
                        },
                        icon: isVisible == true
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    textEditingController: passControl,
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter password";
                      }
                      var regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                      if (!regex.hasMatch(value)) {
                        return "Invalid Password";
                      }
                      return null;
                    },
                    // onSaved: (String? pass) {
                    //   pass = passControl.text;
                    // }
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text("Confirm Password", style: theme.textTheme.labelMedium),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextF(
                      hint: "*************",
                      asterisk: !isSeen,
                      icon: IconButton(
                          onPressed: () {
                            isSeen = !isSeen;
                            setState(() {});
                          },
                          icon: isSeen == true
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      textEditingController: coPassControl,
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please confirm password";
                        }
                        if (value != passControl.text) {
                          return "Password doesn't match";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  MaterialButton(
                      onPressed: () {
                        signUp();
                        register(
                            emailControl.text.toString(),
                            passControl.text.toString(),
                            nameControl.text.toString());
                      },
                      child: Buttons(
                        title: 'Sign up',
                        padd: 15,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: theme.textTheme.labelSmall),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginPage.routeName);
                          },
                          child: const Text("Login",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.lightBlueAccent)))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  signUp() {
    if (formKey.currentState!.validate()) {
      // Navigator.pushNamed(context, HomeLayout.routeName);
    }
  }
}
