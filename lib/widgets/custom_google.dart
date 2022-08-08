import 'package:flutter/material.dart';
import 'package:meddit/constants.dart';

class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.15),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            primary: Colors.black,
            backgroundColor: const Color(0xFFF5F5F5),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Or, sign in with',
                style: kGoogleSign,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 40,
              child: GestureDetector(
                onTap: () {},
                child: TextButton(
                  style: TextButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: null,
                  child: Image.asset(
                    'images/google.png',
                    height: 25,
                    width: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
