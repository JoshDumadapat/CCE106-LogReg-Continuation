import 'package:flutter/material.dart';
import 'package:login_reg_stateful_act/LoginForm.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String errormessage;
  late bool isError;

  @override
  void initState() {
    errormessage = "";
    isError = false;
    super.initState();
  }

  void checkRegister(
    username,
    email,
    age,
    phone,
    password,
  ) {
    setState(() {
      if (username == "") {
        errormessage = "Please input your username!";
        isError = true;
      } else if (email == "") {
        errormessage = "Please input your email!";
        isError = true;
      } else if (age == "") {
        errormessage = "Please input your age!";
        isError = true;
      } else if (phone == "") {
        errormessage = "Please input your phone number!";
        isError = true;
      } else if (password == "") {
        errormessage = "Please input your password!";
        isError = true;
      } else {
        errormessage = "";
        isError = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginForm(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  kToolbarHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/nike.png',
                  height: 50,
                ),
                const SizedBox(height: 60),

                const Text(
                  'Register Page',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),

                const Text(
                  'Register now and shop with us.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),

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
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
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
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 15),

                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Age',
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
                    prefixIcon: const Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(height: 15),

                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
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
                    prefixIcon: const Icon(Icons.phone),
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
                const SizedBox(height: 40),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 46, 48, 49),
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    checkRegister(
                      usernameController.text,
                      emailController.text,
                      ageController.text,
                      phoneController.text,
                      passwordController.text,
                    );

                    if (!isError) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginForm(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Register',
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
                    style: const TextStyle(color: Colors.red),
                  ),

                const SizedBox(height: 15),

                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginForm(),
                      ),
                    );
                  },
                  child: const Text(
                    "Already have an account? Back to Login",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
