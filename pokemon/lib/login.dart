import 'package:flutter/material.dart';
import 'home.dart';
import "social_buttons.dart";
import 'colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        children: [
          const Image(
            image: AssetImage('assets/pokemon-title.jpeg'),
          ),
          const SizedBox(
            height: 30,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              icon: Icon(Icons.email),
            ),
          ),
          TextField(
            obscureText: _isObscure,
            decoration: InputDecoration(
                labelText: 'Password',
                icon: const Icon(Icons.lock), //icon at head of input
                // this button is used to toggle the password visibility
                suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    })),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  loginSuccessful(context);
                },
                icon: const Icon(Icons.login),
                label: const Text('Sign In'),
              ),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  return;
                },
                icon: const Icon(Icons.clear),
                label: const Text('Clear'),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Or, login with...",
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomWidgets.socialButtonCircle(
                  googleColor, FontAwesomeIcons.googlePlusG,
                  iconColor: Colors.white, onTap: () {
                loginSuccessful(context);
              }),
              const SizedBox(
                width: 30,
              ),
              CustomWidgets.socialButtonCircle(
                  linkedinColor, FontAwesomeIcons.linkedinIn,
                  iconColor: Colors.white, onTap: () {
                loginSuccessful(context);
              }),
            ],
          ),
        ],
      ),
    );
  }
}

void loginSuccessful(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const MyHomePage();
      },
    ),
  );
}
