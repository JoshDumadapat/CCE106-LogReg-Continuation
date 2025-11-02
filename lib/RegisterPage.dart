import 'package:flutter/material.dart';
import 'package:login_reg_stateful_act/LoginForm.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController changepasswordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController civilstatusController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  late String errormessage;
  late bool isError;

  @override
  void initState() {
    errormessage = "This is an Error";
    isError = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void checkRegister(
    name,
    username,
    password,
    changepassword,
    gender,
    civilstatus,
    birthdate,
  ) {
    setState(() {
      if (name == "") {
        errormessage = "Please input your name!";
        isError = true;
      } else if (username == "") {
        errormessage = "Please input your username!";
        isError = true;
      } else if (password == "") {
        errormessage = "Please input your password!";
        isError = true;
      } else if (changepassword == "") {
        errormessage = "Please input your new password!";
        isError = true;
      } else if (gender == "") {
        errormessage = "Please input your gender!";
        isError = true;
      } else if (civilstatus == "") {
        errormessage = "Please input your civil status!";
        isError = true;
      } else if (birthdate == "") {
        errormessage = "Please input your birth date!";
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('REGISTER', style: txtstyle),
                  const SizedBox(height: 15),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter name',
                      prefixIcon: Icon(Icons.account_box),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter username',
                      prefixIcon: Icon(Icons.people),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter password',
                      prefixIcon: Icon(Icons.password),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    obscureText: true,
                    controller: changepasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Change password',
                      prefixIcon: Icon(Icons.password),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: genderController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter gender',
                      prefixIcon: Icon(Icons.male),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: civilstatusController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter civil status',
                      prefixIcon: Icon(Icons.social_distance),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: birthdateController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter birth date',
                      prefixIcon: Icon(Icons.date_range),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      checkRegister(
                        nameController.text,
                        usernameController.text,
                        passwordController.text,
                        changepasswordController.text,
                        genderController.text,
                        civilstatusController.text,
                        birthdateController.text,
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
                    child: Text('REGISTER', style: txtstyle2),
                  ),
                  const SizedBox(height: 15),
                  (isError)
                      ? Text(errormessage, style: errortxtstyle)
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
