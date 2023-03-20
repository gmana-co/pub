import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

final Provider<AuthService> authController = Provider((ref) => AuthService(Supabase.instance.client));

class AuthService {
  final SupabaseClient client;

  AuthService(this.client);

  User? getCurrentUser() {
    final User? user = client.auth.currentUser;
    return user;
  }

  Future<void> signIn(String email) async {
    await client.auth.signInWithOtp(email: email);
  }

  Future<void> signUp({required String email, required String password}) async {
    await client.auth.signUp(email: email.trim(), password: password.trim());
  }

  Future<void> verifyOtp({required String email, required String token}) async {
    await client.auth.verifyOTP(email: email, token: token, type: OtpType.magiclink);
  }

  StreamSubscription<AuthState> listenToAuthState() {
    return client.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;

      switch (event) {
        case AuthChangeEvent.passwordRecovery:
          break;
        case AuthChangeEvent.signedIn:
          if (session != null) {}
          break;
        case AuthChangeEvent.signedOut:
          break;
        case AuthChangeEvent.tokenRefreshed:
          break;
        case AuthChangeEvent.userUpdated:
          break;
        case AuthChangeEvent.userDeleted:
          break;
        case AuthChangeEvent.mfaChallengeVerified:
          break;
      }
    });
  }

  bool isLoggedIn() {
    return client.auth.currentSession != null;
  }

  Future<void> signOut() async {
    await client.auth.signOut();
  }
}
