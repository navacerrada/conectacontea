import 'package:conectacontea/app/routes/landing_page.dart';
import 'package:conectacontea/app/routes/session/sign_in_page.dart';
import 'package:conectacontea/app/routes/session/sign_up_page.dart';
import 'package:conectacontea/app/services/auth.dart';
import 'package:conectacontea/app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FormType { signIn, signUp }

class SignInForm extends StatefulWidget {
  final FormType formType;
  const SignInForm({Key? key, required this.formType}) : super(key: key);
  @override
  _SignInFormState createState() => _SignInFormState(formType);
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  FormType _formType;

  void setFormType(FormType type) {
    setState(() {
      _formType = type;
    });
  }

  _SignInFormState(this._formType);
  void _submit() async {
    try {
      final auth = Provider.of<FirebaseAuthentication>(context, listen: false);
      if (_formType == FormType.signIn) {
        await auth.signInWithEmail(_email, _password);
      } else if (_formType == FormType.signUp) {
        await auth.signUpWithEmail(_email, _password);
      }
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LandingPage(),
      ));
    } catch (e) {
      print(e.toString());
    }
  }

  void _goToSignUp(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignUpPage(),
    ));
  }

  void _goToSignIn(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignInPage.create(context),
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (_formType == FormType.signIn) {
      return buildSignInForm(context);
    } else {
      return buildSignUpForm(context);
    }
  }

  Widget buildSignUpForm(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          padding: EdgeInsets.all(4),
          child: ElevatedButton.icon(
            icon: Icon(Icons.add_a_photo_outlined),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[100],
              onPrimary: Colors.grey[700],
              shape: CircleBorder(),
              elevation: 10,
            ),
            onPressed: () {},
            label: Text('Subir imagen'),
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10),
          color: Colors.blue[100],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  cursorColor: Colors.lightBlue[400],
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Nombre',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _emailController,
                  cursorColor: Colors.lightBlue[400],
                  decoration: InputDecoration(
                    icon: Icon(Icons.alternate_email_rounded),
                    labelText: 'Coerro Electrónico',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock_sharp),
                    labelText: 'Contraseña',
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: MaterialButton(
            child: Text(
              '¿Ya tienes una cuenta?',
              style: TextStyle(
                color: Colors.indigo,
              ),
            ),
            onPressed: () => _goToSignIn(context),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        LongRoundButton(
          text: 'Crear Cuenta',
          color: const Color(0xffBBDEFB),
          onPressed: _submit,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        ),
      ],
    );
  }

  Widget buildSignInForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          margin: EdgeInsets.all(10),
          color: Colors.blue[100],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.alternate_email_rounded),
                    labelText: 'Coerro Electrónico',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    icon: Icon(Icons.lock_sharp),
                    labelText: 'Contraseña',
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: MaterialButton(
            child: Text(
              '¿Has olvidado la contraseña?',
              style: TextStyle(
                color: Colors.indigo,
              ),
            ),
            onPressed: () {},
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: MaterialButton(
            child: Text(
              '¿No tienes una cuenta?',
              style: TextStyle(
                color: Colors.indigo,
              ),
            ),
            onPressed: () => _goToSignUp(context),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        LongRoundButton(
          text: 'Iniciar Sesión',
          color: const Color(0xffBBDEFB),
          onPressed: _submit,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        ),
      ],
    );
  }
}
