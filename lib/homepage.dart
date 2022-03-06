import 'package:flutter/material.dart';
import 'package:madassignment1/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                pref.remove("isLogged");
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginPage()));
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: const Center(child: Text("Hello user!")),
    );
  }
}