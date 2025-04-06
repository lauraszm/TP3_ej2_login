import 'package:ejercicio2_login/entidades/greeting-interface.dart';

class User implements GreetingInterface {
  String email;
  String password;
  String name;
  int? age;

  User({required this.email, required this.password, this.name = 'Laura', this.age});

  String showData(){
    return 'Email: $email, Pass: $password, Name: $name, Age: $age';
  }
  
  @override
  String greet() {
    return 'Hola $name';
  }

}