import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

import '../data/auth_repository.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository());

final authProvider = Provider<Auth>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return Auth(authRepository);
});

class Auth {
  final AuthRepository _authRepository;

  Auth(this._authRepository);

  Future<User?> signIn(String email, String password) async {
    return _authRepository.signInWithEmailAndPassword(email, password);
  }

  Future<User?> signUp(String email, String password) async {
    return _authRepository.signUpWithEmailAndPassword(email, password);
  }

  Future<User?> googleSignIn() async {
    return _authRepository.signInWithGoogle();
  }

  Future<void> signOut() async {
    return _authRepository.signOut();
  }
}
