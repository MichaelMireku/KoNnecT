
import 'package:KoNnecT/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:KoNnecT/components/text_field.dart';
import 'package:KoNnecT/components/button.dart';
import 'package:KoNnecT/components/square_tile.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  //sign user in
  void signIn() async {

    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );

      //pop loading circle
      if (context.mounted) Navigator.pop(context);
    }on FirebaseAuthException catch (e) {
      displayMessage(e.code);

      //pop loading circle
      Navigator.pop(context);
      //display error message
      displayMessage(e.code);

    }
  }

  //display a dialog message
  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
   backgroundColor: Colors.white,
    body:SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height:50),
          
              //logo
              const Icon(
                Icons.lock_open_rounded,
                size: 100,
              ),
              const SizedBox(height: 30),
          
              //Welcome back message
              const Text(
                "Welcome back, you've been missed!",
              ),
          
              const SizedBox(height: 25),
          
              // email textfield
              MyTextField(controller: emailTextController,
                  hintText: 'Email',
                  obscureText: false,
              ),
          
              const SizedBox(height: 10),
              
              //password textfield
              MyTextField(controller: passwordTextController,
                  hintText: 'Password',
                  obscureText: true,
              ),
          
              const SizedBox(height: 10),

          //Forgot password?
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?',
                  style: TextStyle(color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              ),
              ),
          const SizedBox(height: 25),

          //sign in button
          MyButton(onTap: signIn,
          text: 'Sign In',
              ),
          
              const SizedBox(height: 35),

              //or continue with
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                  ),
            Text('Or continue with'),
                  Expanded(
                 child: Divider(
                      thickness: 0.5,
                  color: Colors.grey[400],
                  ),
                  ),
                ],
              ),
              ),
              //go to register page
const SizedBox(height:6),
               //google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  SquareTile(imagePath: 'lib/images/google.png'),

        //apple button
                  SquareTile(imagePath: 'lib/images/apple.png'),
              ],
              ),

              const SizedBox(height: 18),

    //not a member?register nowL
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('Not a member?', style: TextStyle(color: Colors.grey[700],),
    ),
    const SizedBox(width: 4),

    GestureDetector(
    onTap: widget.onTap,
    child:Text("Register now",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    ),
    ),
    ),
    ],
    ),

            ],
          ),


      ),
    ),
    ),
  ),
  );
  }
}

