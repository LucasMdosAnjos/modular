import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:slidy_aula_2/app/shared/auth/repositories/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository{

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future getEmailPasswordLogin() {
    // TODO: implement getEmailPasswordLogin
    throw UnimplementedError();
  }

  @override
  Future getFacebookLogin() {
    // TODO: implement getFacebookLogin
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> getGoogleLogin() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  print("signed in " + user.displayName);
  return user;
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> getUser() async {
    final FirebaseUser user = await _auth.currentUser();
    return user;
  }

  @override
  Future getLogout() async {
   await _auth.signOut();
  }

}