import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  void _login() async {
    final url = Uri.parse("https://reqres.in/api/login");
    final response = await http.post(url, body: {
      "email": _emailController.text,
      "password": _passwordController.text
    });

    if (response.statusCode == 200) {
      final pref = await SharedPreferences.getInstance();

      pref.setBool("isLogged", true);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
    }
  }

  void _register() async {
    final url = Uri.parse("https://reqres.in/api/register");
    final response = await http.post(url, body: {
      "email": _emailController.text,
      "password": _passwordController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login here"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: "Email"),
                controller: _emailController,
              ),
              TextField(
                decoration: const InputDecoration(hintText: "Password"),
                controller: _passwordController,
              ),
              TextButton(onPressed: _login, child: const Text("Login")),
              TextButton(onPressed: _register, child: const Text("Register"))
            ],
          ),
        ));
  }
}

