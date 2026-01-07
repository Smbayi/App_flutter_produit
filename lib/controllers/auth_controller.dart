import '../services/firebase_auth_service.dart';

class AuthController {
  final FirebaseAuthService _service = FirebaseAuthService();

  Future<bool> signUp(String email, String password) async {
    var user = await _service.signUp(email, password);
    return user != null;
  }

  Future<bool> login(String email, String password) async {
    var user = await _service.login(email, password);
    return user != null;
  }

  Future<bool> googleAuth() async {
    var user = await _service.signInWithGoogle();
    return user != null;
  }

  Future<void> logout() async {
    await _service.logout();
  }

  bool isLoggedIn() {
    return _service.isLoggedIn();
  }
}
