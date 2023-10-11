import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/components/my_button.dart';
import 'package:login_ui/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});

  final Function()? onTap;

  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in user
  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                //logo
                Icon(
                  Icons.lock,
                  size: 100,
                ),
                SizedBox(
                  height: 50,
                ),
                //welcome back
                Text(
                  'Welcome Back, you\'ve been missed!',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 60,
                ),
                //username textfield
                MyTextField(
                    controller: emailController,
                    hintText: 'Username or Mail ID',
                    obscureText: false),
                //password textfield
                SizedBox(
                  height: 15,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
                SizedBox(
                  height: 20,
                ),
                //forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                //sign in button
                MyButton(
                  onTap: signUserIn,
                  text: 'Sign In',
                  myColor: Colors.black,
                ),
                //or continue with
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Text(
                      'Or Continue With',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                //google + apple signin button
                MyButton(
                  onTap: () {},
                  text: 'Google',
                  myColor: Colors.red,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        ' Register Here',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
