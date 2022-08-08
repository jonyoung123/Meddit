import 'dart:ui';
import 'package:meddit/screens/registration_page.dart';
import 'package:meddit/widgets/elevated_widgets.dart';
import 'package:meddit/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:meddit/constants.dart';
import 'package:meddit/custom_paints/register_custom.dart';
import 'package:meddit/widgets/custom_google.dart';
import 'package:meddit/screens/meddit_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isClicked = false;
  TextEditingController myController = TextEditingController();
  TextEditingController myController1 = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    myController.dispose();
    myController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double width1 = width * 0.08;
    double height2 = height * -0.15;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: Colors.black,
          ),
          Image.asset(
            'images/meddit_bg.jpeg',
            height: height * 0.3,
            width: width,
          ),
          Positioned(
            top: height * 0.07,
            left: width1,
            right: width1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome back',
                  style: kRegisterHeader,
                ),
                Text(
                  'Take a break, Meddit is here to help.',
                  style: kRegisterText,
                )
              ],
            ),
          ),
          Positioned(
              top: height * 0.25,
              height: height * 0.75,
              width: width,
              child: CustomPaint(
                painter: RegistrationPageCustom(
                    color: Colors.white,
                    height: height2,
                    width1: width * 0.7,
                    width2: width * 0.3,
                    height0: height * 0.08,
                    height2: height * 0.14,
                    height3: height * 0.12),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width1,
                      right: width1,
                      top: height * 0.08,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: SizedBox(
                        //height: height * 0.6,
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldWidget(
                              myController: myController,
                              text: 'Email',
                              hintText: 'Zainab@gmail.com',
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (String? text) {
                                return text != null && text.contains('@')
                                    ? null
                                    : 'email address incorrect';
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFieldWidget(
                              obscureText: isClicked ? false : true,
                              myController: myController1,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return value != null && value.length < 6
                                    ? 'password must contain at least 6 characters'
                                    : null;
                              },
                              text: 'Password',
                              hintText: '••••••••••',
                              iconButton: IconButton(
                                icon: isClicked
                                    ? const Icon(Icons.visibility_off_outlined)
                                    : const Icon(Icons.visibility_outlined),
                                onPressed: () {
                                  setState(() {
                                    isClicked = !isClicked;
                                  });
                                },
                                color: const Color.fromARGB(255, 182, 176, 176),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'Forgot password?',
                                  style: kForgotPassword,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.06,
                            ),
                            ElevatedButtonWidget(
                                width: width,
                                backgroundColor: Colors.black,
                                child: const Text(
                                  'Sign in',
                                  style: kRegisterStyle,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MedditPage()));
                                }),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Don't have an account? ",
                                      style: kHintStyle,
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegistrationPage())),
                                      child: const Text(
                                        'Register!',
                                        style: kSignStyle,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                CustomGoogleButton(width: width),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                      style: kAgreeStyle,
                                      children: [
                                        TextSpan(
                                            text:
                                                'By signing up, you agree to our '),
                                        TextSpan(
                                            text: 'Terms of service',
                                            style: kTermsStyle),
                                        TextSpan(text: ' and '),
                                        TextSpan(
                                            text: 'Privacy policy',
                                            style: kTermsStyle)
                                      ]),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
