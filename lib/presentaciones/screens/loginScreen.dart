import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ejercicio2_login/entidades/user.dart';
import 'package:ejercicio2_login/data/users.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _Screen1State();
}

class _Screen1State extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String username = '';
  String password = '';


  User? getUser(String email) {
    final searchedUser = users.where((user) => user.email == email);
    return searchedUser.isNotEmpty ? searchedUser.first : null;
  }

  void login() {
    setState(() {
      username = userNameController.text;
      password = passController.text;
      if (username == '' || password == '') {
        showMessage("Ingrese todos los datos");
      } else {
        User? searchedUser = getUser(username);
        if (searchedUser != null) {
          if (searchedUser.password == password) {
            context.push('/login', extra: searchedUser.name);
          } else {
            showMessage("Password incorrecta");
          }
        } else {
          showMessage("Usuario incorrecto");
        }
      }
    });
  }
void showMessage(String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text)),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
                
              ),
            ),
            ElevatedButton(onPressed: login, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
