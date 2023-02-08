import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class LiquimechCloudFirebaseUser {
  LiquimechCloudFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

LiquimechCloudFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<LiquimechCloudFirebaseUser> liquimechCloudFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<LiquimechCloudFirebaseUser>(
      (user) {
        currentUser = LiquimechCloudFirebaseUser(user);
        return currentUser!;
      },
    );
