import 'package:Expensely/screens/authentication/user.dart';
import 'package:Expensely/screens/loadingScreen.dart';
import 'package:Expensely/screens/screenRouter.dart';
import 'package:Expensely/services/authService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        //Once complete, show the app
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<CurrentUser>.value(
            value: AuthService().user,
            child: MaterialApp(
              home: ScreenRouter(),
            ),
          );
        }

        return MaterialApp(
          home: Loading(),
        );
      },
    );
  }
}
