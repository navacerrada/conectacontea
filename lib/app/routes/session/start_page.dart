import 'package:conectacontea/app/routes/session/sign_in_page.dart';
import 'package:conectacontea/app/routes/session/sign_up_page.dart';
import 'package:conectacontea/app/widgets/custom_buttons.dart';
import 'package:conectacontea/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  void _goToSignIn(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignInPage.create(context),
    ));
  }

  void _goToSignUp(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignUpPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xb32460da),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 11 / 5,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/logo.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: AppName(
                firstColor: Colors.white,
                secondColor: Colors.white,
                thirdColor: Colors.white,
              ),
            ),
            CustomButton(
              child: Text(
                '¡YA TENGO CUENTA!',
                style: TextStyle(
                    fontFamily: 'Trebuchet MS',
                    fontSize: 25,
                    color: Colors.white,
                    decorationStyle: TextDecorationStyle.dotted),
              ),
              color: Colors.lightBlue,
              onPressed: () => _goToSignIn(context),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            ),
            CustomButton(
              child: Text(
                'CREAR CUENTA',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlue,
              onPressed: () => _goToSignUp(context),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            ),
          ],
        ),
      ),
    );
  }
}
