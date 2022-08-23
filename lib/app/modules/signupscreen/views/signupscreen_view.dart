import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/app/modules/authenticationscreen/controllers/authenticationscreen_controller.dart';
import 'package:newsapp/app/modules/constants/constants.dart';

import '../controllers/signupscreen_controller.dart';

class SignupscreenView extends GetView<SignupscreenController> {
  AuthenticationscreenController _controller =
      Get.put(AuthenticationscreenController());

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea( 
            child: Container(
      width: getwidth(context, 100),
      height: getheight(context, 100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: getwidth(context, 90),
                height: getheight(context, 20),
                child: RichText(
                  text: TextSpan(
                      text: ' Hello\n There',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                      ),
                      children: [
                        TextSpan(
                          text: '.',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TextFormField(
                  controller: namecontroller,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      hintText: "Enter your name",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      fillColor: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length > 2) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              // textfeilds(
              //     "Enter Your Name", Icons.person, false, namecontroller, true),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TextFormField(
                  controller: emailcontroller,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      hintText: "Enter your email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      fillColor: Colors.white),
                  validator: (value) => EmailValidator.validate(value!)
                      ? null
                      : "Please enter a valid email",
                ),
              ),
              // textfeilds("Email", Icons.email, false, emailcontroller, false),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TextFormField(
                  controller: passwordcontroller,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      hintText: "Enter your password ",
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.black,
                      ),
                      fillColor: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length > 2) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              // textfeilds(
              //     "Password", Icons.password, true, passwordcontroller, false),
              SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Container(
                    height: getheight(context, 7),
                    width: getwidth(context, 60),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25)),
                    child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AuthenticationscreenController.instance.register(
                                namecontroller.text.trim(),
                                emailcontroller.text.trim(),
                                passwordcontroller.text.trim());
                          }
                        },
                        child: Text(
                          "REGISTER  ",
                          style: TextStyle(color: Colors.white),
                        ))),
              ),
            ],
          ),
        ),
      ),
    )));
  }
}

String validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address';
  else
    return '';
}
