import 'package:flutter/material.dart';
import 'package:login_reg_stateful_act/RegisterPage.dart';
import 'package:login_reg_stateful_act/HomePage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String errormessage;
  late bool isError;

  @override
  void initState() {
    errormessage = "";
    isError = false;
    super.initState();
  }

  void checkLogin(username, password) {
    setState(() {
      if (username.isEmpty) {
        errormessage = "Please input your username!";
        isError = true;
      } else if (password.isEmpty) {
        errormessage = "Please input your password!";
        isError = true;
      } else {
        errormessage = "";
        isError = false;

        // ✅ If login is successful, go to HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LOGIN FORM', style: txtstyle),
              const SizedBox(height: 15),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Username',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Password',
                  prefixIcon: Icon(Icons.password),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  checkLogin(
                      usernameController.text, passwordController.text);
                },
                child: Text('LOGIN', style: txtstyle2),
              ),
              const SizedBox(height: 15),
              if (isError)
                Text(errormessage, style: errortxtstyle),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  // ✅ Navigate to RegisterPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: Text('Create an Account', style: registertxtstyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Text Styles
var txtstyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 38,
);

var registertxtstyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 18,
);

var errortxtstyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
  fontSize: 14,
  color: Colors.red,
);

var txtstyle2 = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 24,
  color: Colors.white,
);
