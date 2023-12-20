import 'package:firebase_auth/firebase_auth.dart';

class AuthUtils {
  static String getCurrentUserId() {
    final User? user = FirebaseAuth.instance.currentUser;
    return user?.uid ?? '';
  }
}
