import 'package:conectacontea/app/routes/session/sign_in_form.dart';
import 'package:conectacontea/app/services/auth.dart';
import 'package:conectacontea/app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  Future<void> _signUpWithGoogle(BuildContext context) async {
    final auth = Provider.of<FirebaseAuthentication>(context);
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Registro de Usuarios',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xb32460da),
        ),
        resizeToAvoidBottomInset: false,
        body: _buildContainer(context));
  }

  Widget _buildContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              SignInForm(
                formType: FormType.signUp,
              ),
              SizedBox(
                height: 60,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 1,
                      decoration: BoxDecoration(color: Colors.blueGrey),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 4, right: 4),
                      color: Colors.white,
                      child: Text(
                        'O',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueGrey,
                            backgroundColor: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: LongRoundButtonWithIcon(
                  path: 'assets/images/google-logo.png',
                  text: 'Iniciar Sesión con Google',
                  color: Colors.white,
                  onPressed: () => _signUpWithGoogle(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
