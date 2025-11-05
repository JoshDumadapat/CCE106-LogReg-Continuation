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

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/nike.png',
                height: 50,
              ),
              const SizedBox(height: 50),

              const Text(
                'Login Now',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),

              const Text(
                'Just Do It — Sign in to your Nike account',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),

              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 25),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 46, 48, 49),
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  checkLogin(
                    usernameController.text,
                    passwordController.text,
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              if (isError)
                Text(
                  errormessage,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 15),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: const Text(
                  "Don't have an account? Register",
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
