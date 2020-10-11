import 'package:Expensely/screens/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication/user.dart';

class ScreenRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser>(context);
    print(user.uid);
    return Authentication();
  }
}
