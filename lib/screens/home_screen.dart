import 'package:flutter/material.dart';
import 'package:meddit/widgets/elevated_widgets.dart';
import 'package:meddit/custom_paints/custom_home.dart';
import 'package:meddit/constants.dart';
import 'package:meddit/screens/registration_page.dart';
import 'package:meddit/screens/signIn_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double width1 = width * 0.09;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.4,
            color: Colors.black,
            child: Stack(
              children: [
                Image.asset(
                  'images/meddit_bg.jpeg',
                  width: width,
                ),
                Positioned(
                    top: height * 0.18,
                    left: width1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Meddit',
                          style: kMainHeadding,
                        ),
                        Text(
                          'Relaxation for all',
                          style: kSubHeadding,
                        )
                      ],
                    ))
              ],
            ),
          ),
          CustomPaint(
            painter: MyCustomPainter(color: Colors.white),
            child: SizedBox(
              height: height * 0.6,
              width: width,
              child: Padding(
                padding: EdgeInsets.only(
                    left: width1, right: width1, top: 40, bottom: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'You first.',
                          style: kHeadingStyle,
                        ),
                        Text(
                            'Release tension with customized relaxation plans that are tailored specifically for you.',
                            style: kTextStyle)
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButtonWidget(
                          width: width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationPage()));
                          },
                          backgroundColor: Colors.black,
                          child: const Text(
                            'Register',
                            style: kRegisterStyle,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButtonWidget(
                          backgroundColor: Colors.white,
                          width: width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
                          },
                          child: const Text(
                            'Sign In',
                            style: kSignStyle,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
