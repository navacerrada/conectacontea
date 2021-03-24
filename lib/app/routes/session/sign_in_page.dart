import 'package:conectacontea/app/routes/session/sign_in_bloc.dart';
import 'package:conectacontea/app/routes/session/sign_in_form.dart';
import 'package:conectacontea/app/services/auth.dart';
import 'package:conectacontea/app/widgets/custom_buttons.dart';
import 'package:conectacontea/app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final SignInBloc bloc;

  const SignInPage({Key? key, required this.bloc}) : super(key: key);

  static Widget create(BuildContext context) {
    final auth = Provider.of<FirebaseAuthentication>(context);
    return Provider<SignInBloc>(
      create: (_) => SignInBloc(auth: auth),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<SignInBloc>(
        builder: (_, bloc, __) => SignInPage(bloc: bloc),
      ),
    );
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    final auth = Provider.of<FirebaseAuthentication>(context, listen: false);
    try {
      bloc.setIsLoading(true);
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    } finally {
      bloc.setIsLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Inicio de Sesión',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xb32460da),
        ),
        resizeToAvoidBottomInset: false,
        body: StreamBuilder<bool>(
            stream: bloc.isLoadingController,
            initialData: false,
            builder: (context, snapshot) {
              return _buildContainer(context, snapshot.data!);
            }));
  }

  Widget _buildContainer(BuildContext context, bool isLoading) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 10 / 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage('assets/images/logo.png'),
                ),
                AppName(),
              ],
            ),
          ),
          Column(
            children: [
              SignInForm(
                formType: FormType.signIn,
              ),
              SizedBox(
                height: 60,
                child: _buildLoading(isLoading),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: LongRoundButtonWithIcon(
                  path: 'assets/images/google-logo.png',
                  text: 'Iniciar Sesión con Google',
                  color: Colors.white,
                  onPressed:
                      isLoading ? null : () => _signInWithGoogle(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoading(bool isLoading) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Stack(
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
      );
    }
  }
}
