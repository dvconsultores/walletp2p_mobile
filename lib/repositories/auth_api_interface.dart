import 'package:wallet_p2p/models/profile_model.dart';

abstract class AuthApiInterface {
  Future<void> signIn();
  Future<ProfileModel> signUp();
  void signOut();
  void clearTokenAuth();
}
