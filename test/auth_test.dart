import 'package:flutter_test/flutter_test.dart';
import 'package:flutterm/services/auth/auth_provider.dart';
import 'package:flutterm/services/auth/auth_user.dart';
void main(){

}
class NotInitialzedExceptiion implements Exception{

}

class MockAuthProvider implements AuthProvider{
  var _isInitialized = false;
  bool get isInitialized => _isInitialized;
  @override
  Future<AuthUser> createUser({required String email, required String password}) async{
    // TODO: implement createUser
    if(!isInitialized) throw NotInitialzedExceptiion();
     await Future.delayed((const Duration(seconds: 1)));
     return logIn(email:email,password:password,);
  }

  @override
  // TODO: implement currentUser
  AuthUser? get currentUser => throw UnimplementedError();

  @override
  Future<void> initialize() {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<AuthUser> logIn({required String email, required String password}) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();
  }

}