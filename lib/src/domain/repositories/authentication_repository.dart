import 'package:aniquiz/src/domain/db/cloud_firestore_db/cloud_firestore_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpWithEmailAndPasswordFailure implements Exception {
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
  final String message;
}

class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

class LogInWithGoogleFailure implements Exception {
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed. Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }
  final String message;
}

class LogOutFailure implements Exception {}

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;

  AuthenticationRepository({
    FirebaseAuth? firebaseAuth,
    // EmailAuth? emailOTPProvider,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  //TODO: Нужно будет переделать на отслеживания tenantId чтобы понимать когда аккаунт удален или дизейблинутный
  Stream<User?> get user {
    return _firebaseAuth.idTokenChanges();
  }

  User? get currentFirebaseUser {
    return _firebaseAuth.currentUser;
  }

  // Future<void> sendOTP({
  //   required String email,
  //   required int otpLength,
  // }) async {
  //   await _emailOTPProvider.sendOtp(recipientMail: email, otpLength: otpLength);
  // }

  // bool validateOTP({
  //   required String email,
  //   required String userOtp,
  // }) {
  //   return _emailOTPProvider.validateOtp(
  //     recipientMail: email,
  //     userOtp: userOtp,
  //   );
  // }

  Future<bool> userExist({required String email}) async {
    final users = CloudFirestoreManager.instance.collection('users');

    final result = await users.where('email', isEqualTo: email).get();
    if (result.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> createUser({
    required String uid,
    required String name,
    required String email,
    required String password,
  }) async {
    final users = CloudFirestoreManager.instance.collection('users');
    final userPrivate =
        CloudFirestoreManager.instance.collection('users/$email/private');
    await users.doc(email).set({
      'deleted': false,
      'lastUpdate': FieldValue.serverTimestamp(),
      'email': email,
      'name': name,
      'avatar': '',
      'uid': uid,
    });
    await userPrivate.doc('userPrivateInfo').set({
      'password': password,
    });
  }

  Future<void> signUp(
      {required String username,
      required String email,
      required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(username);
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  Future<void> reLogInWithEmail({
    required String email,
  }) async {
    final userPrivate =
        CloudFirestoreManager.instance.collection('users/$email/private');
    try {
      final password = await userPrivate
          .doc('userPrivateInfo')
          .get()
          .then((doc) => doc.data()!['password'] as String);
      await _firebaseAuth.currentUser?.reauthenticateWithCredential(
        EmailAuthProvider.credential(
          email: email,
          password: password,
        ),
      );
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> reLogInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.currentUser?.reauthenticateWithCredential(
        EmailAuthProvider.credential(
          email: email,
          password: password,
        ),
      );
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
      // await Future.wait([
      //   _firebaseAuth.signOut(),
      //   _googleSignIn.signOut(),
      // ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}
