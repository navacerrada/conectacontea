import 'dart:async';

import 'package:conectacontea/app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInBloc {
  final FirebaseAuthentication auth;
  final StreamController<bool> _isLoadingController = StreamController<bool>();

  SignInBloc({required this.auth});
  Stream<bool> get isLoadingController => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
  }

  void setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future<User?> signInWithGoogle() async {
    try {
      setIsLoading(true);
      return await auth.signInWithGoogle();
    } catch (e) {} finally {
      setIsLoading(false);
    }
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      setIsLoading(true);
      return await auth.signInWithGoogle();
    } catch (e) {
      setIsLoading(false);
    }
  }
}
