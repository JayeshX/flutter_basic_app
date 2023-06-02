import 'package:flutter/material.dart';
import '../constants/routes.dart';
import '../enums/menu_action.dart';
import 'package:flutterm/services/auth/auth_service.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main UI'),
          actions: [
            PopupMenuButton<MenuAction>(
              onSelected: (value) async {
                switch (value){

                  case MenuAction.logout:
                    final shouldLogout = await showLogOutDialog(context);
                    if (shouldLogout){
                      AuthService.firebase().logOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        loginRoute,
                            (route) => false,
                      );
                    }
                    break;
                }
              },itemBuilder: (context){
              return const[
                PopupMenuItem<MenuAction>(
                    value: MenuAction.logout,
                    child: Text('logout')
                ),
              ];
            },
            )
          ],
        ),
        body: const Text('hello world')
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context){
  return showDialog<bool>(
      context: context,
      builder: (context){
        return AlertDialog(
          title: const Text('Sign out'),
          content: const Text('Sure you wanna log out?'),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop(false);
            }, child: const Text('cancel')
            ),
            TextButton(onPressed: (){
              Navigator.of(context).pop(true);
            }, child: const Text('Logout')
            )
          ],
        );
      }).then((value) => value ?? false);
}
