// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:adhicene/firebase_auth/check_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';
import 'forgot_password.dart';

class Login extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const Login({super.key, required this.showRegisterPage});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = true;
  bool emailErrorVisible = false;
  bool passwordErrorVisible = false;

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //methods
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Future signIn() async {
    if (EmailValidator.validate(_emailController.text.trim().toString())) {
      if (validatePassword(_passwordController.text.trim().toString())) {
        setState(() {
          emailErrorVisible = false;
          passwordErrorVisible = false;
        });
        showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            });
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        Navigator.pop(context);
      } else {
        setState(() {
          passwordErrorVisible = true;
        });
      }
    } else {
      setState(() {
        emailErrorVisible = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return false;
    } else {
      if (!regex.hasMatch(value)) {
        return false;
      } else {
        return true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/logog.jpg',
                    width: 120,
                    height: 120,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 42,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(
                        Icons.alternate_email,
                        color: Colors.cyan[300],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Email Address",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                emailErrorVisible
                    ? Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Incorrect Email Address",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock_outline,
                        color: Colors.cyan[300],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _isHidden,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: _togglePasswordView,
                              icon: Icon(
                                _isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey[200],
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      passwordErrorVisible
                          ? Text(
                              "Invalid Password format",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w300),
                            )
                          : Container(),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ForgotPasswordPage();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(children: <Widget>[
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "OR",
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                  ),
                  Expanded(child: Divider()),
                ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          CheckPage().signInWithGoogle();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/g.png',
                                width: 40,
                                height: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Continue with Google',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New to Adhicine?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text("Sign Up",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
