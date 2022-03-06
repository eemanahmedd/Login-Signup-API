import 'package:flutter/material.dart';
import 'package:madassignment1/homepage.dart';
import 'package:madassignment1/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Func extends StatelessWidget {
  const Func({Key? key}) : super(key: key);

  Future<bool> _future() async {
    final pref = await SharedPreferences.getInstance();

    return pref.getBool("isLogged") != null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: _future(),
        builder: (_, AsyncSnapshot<bool> snapShot) {
          if (snapShot.hasData) {
            if (snapShot.data!) {
              return const HomePage();
            }
            return const LoginPage();
          }
          return Container();
        });
  }
}
