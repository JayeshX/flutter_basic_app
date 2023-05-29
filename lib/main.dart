import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterm/views/login_view.dart';
import 'package:flutterm/views/register_view.dart';

import 'firebase_options.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized(); //initialize firebase for all the widgets in the screen.

  runApp(
    MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ),
  );
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HOME"),
        ),
        body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState){
              case ConnectionState.done:
                final user = FirebaseAuth.instance.currentUser;
                if (user?.emailVerified ?? false){
                  print('You are verified');
                }else{
                  print('please verify');
                }
                return const Text('Done');
              default:
                return const Text("Loading....");
            }

          },
        )
    );
  }
}

