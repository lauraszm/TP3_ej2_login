import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  String name;
  WelcomeScreen({super.key, required this.name});
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bienvenido/a"),
            Text(name),
            ElevatedButton(
              onPressed: () {
                context.push('/');
              }, 
              child: const Text("Logout")
            ),
          ],
        ),
      ),
    );
  }
}
