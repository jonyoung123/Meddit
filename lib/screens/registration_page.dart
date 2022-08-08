import 'package:flutter/material.dart';
import 'package:meddit/constants.dart';
import 'package:meddit/custom_paints/register_custom.dart';
import 'package:meddit/screens/meddit_screen.dart';
import 'package:meddit/screens/signIn_page.dart';
import 'package:meddit/widgets/custom_google.dart';
import 'package:meddit/widgets/elevated_widgets.dart';
import 'package:meddit/widgets/text_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();
  bool isClicked = true;
  bool isClicked2 = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double width1 = width * 0.07;
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
            height: height * 0.35,
            width: width,
          ),
          Positioned(
            top: height * 0.09,
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
              top: height * 0.26,
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
                child: SizedBox(
                  //height: height * 0.6,
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width1,
                        right: width1,
                        top: height * 0.08,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldWidget(
                            text: 'Email',
                            hintText: 'Zainab@gmail.com',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (String? value) {
                              return value != null && value.contains('@')
                                  ? null
                                  : 'email is incorrect';
                            },
                            myController: emailController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget(
                            obscureText: isClicked ? false : true,
                            myController: passwordController,
                            text: 'Password',
                            hintText: '••••••••••',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              return value != null && value.length < 6
                                  ? 'password must contain at least 6 characters '
                                  : null;
                            },
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
                            height: 10,
                          ),
                          TextFieldWidget(
                            obscureText: isClicked2 ? false : true,
                            myController: confPasswordController,
                            text: 'Confirm Password',
                            hintText: '••••••••••',
                            iconButton: IconButton(
                              icon: isClicked2
                                  ? const Icon(Icons.visibility_off_outlined)
                                  : const Icon(Icons.visibility_outlined),
                              onPressed: () {
                                setState(() {
                                  isClicked2 = !isClicked2;
                                });
                              },
                              color: const Color.fromARGB(255, 182, 176, 176),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.06,
                          ),
                          ElevatedButtonWidget(
                              backgroundColor: Colors.black,
                              width: width,
                              child: const Text(
                                'Register',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: kHintStyle,
                              ),
                              GestureDetector(
                                  onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignInPage()),
                                      ),
                                  child: const Text(
                                    'Sign in!',
                                    style: kSignStyle,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          CustomGoogleButton(width: width)
                        ],
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
