import 'package:flutter/material.dart';
import '../constants/routes.dart';
import 'package:flutterm/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Verify Email'
        ),
      ),
      body: Column(
        children: [
          const Text("We've sent you an email. Please open to verify account"),
          const Text('If You have not recieved a verification email, press the button below'),
          TextButton(
              onPressed: () async{
                await AuthService.firebase().sendEmailVerification();
              }
              , child: const Text('resend email verification')
          ),
          TextButton(
              onPressed: () async{
                await AuthService.firebase().logOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                   (route) => false,
                );
              }
              , child: const Text('Restart registration Process')
          )
        ],
      ),
    );
  }
}
