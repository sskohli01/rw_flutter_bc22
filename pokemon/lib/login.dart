import 'package:flutter/material.dart';
import 'home.dart';
import 'social_buttons.dart';
import 'colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

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
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.email),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    return isValidEmail(value);
                  },
                ),
                TextFormField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    icon: const Icon(Icons.lock), //icon at head of input
                    // this button is used to toggle the password visibility
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    return isValidPassword(value);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  validateFields(context, _formKey);
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
            'Or, login with...',
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

enum MessageType {
  emailEmpty,
  passwordEmpty,
  passwordLen,
  emailInvalid,
  passwordInvalid
}

/// Method: returnErrorMessage is used to return error message for a given enum
/// params: MessageType : provided to be worded
/// returns: the error message corresponding to the MessageType Provided
String returnErrorMessage(MessageType val) {
  switch (val) {
    case MessageType.emailEmpty:
      return 'Email cannot be empty.';
    case MessageType.passwordLen:
      return 'Password should have atleast 6 characters';
    case MessageType.passwordEmpty:
      return 'Password cannot be empty.';
    case MessageType.emailInvalid:
      return 'Invalid email address.';
    case MessageType.passwordInvalid:
      return '''Weak Password. Please use at least one uppercase letter,\none lowercase letter, one number, and one special character.''';
    default:
      return 'Message type not found. $val';
  }
}

/// Method: isValidPassword is used to check if the password entered is valid
/// params: password: to be validated
/// returns: null if the password is valid or the error message is it's invalid
String? isValidPassword(String? password) {
  //first condition, password cannot be empty
  if (password == null || password.isEmpty) {
    return returnErrorMessage(MessageType.passwordEmpty);
  }

  //second condition, password should be atleast 6 characters long
  if (password.length < 6) {
    return returnErrorMessage(MessageType.passwordLen);
  }

  //regex for third condition, password should have at least one uppercase
  //letter,\none lowercase letter, one number, and one special character
  const pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{6,}$';
  final regExp = RegExp(pattern);

  //check if the password matches the regex
  if (!regExp.hasMatch(password)) {
    return returnErrorMessage(MessageType.passwordInvalid);
  }
  return null;
}

/// Method: isValidEmail is used to check if the Email entered is valid
/// params: email: to be validated
/// returns: null if the Email is valid or the error message is it's invalid
String? isValidEmail(String? email) {
  //first condition, email should not be empty
  if (email == null || email.isEmpty) {
    return returnErrorMessage(MessageType.emailEmpty);
  }

  //regex for second condition, valid email address
  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);

  //check if the email matches the regex
  if (!regExp.hasMatch(email)) {
    return returnErrorMessage(MessageType.emailInvalid);
  }
  return null;
}

/// Method: validateFields is fired when the user presses the login button,
/// it validates the form and if fields are valid, goes to the next screen
/// otherwise shows the error message
/// params: Context and Formkey
/// returns: void
void validateFields(BuildContext context, GlobalKey<FormState> formKey) {
  // Validate returns true if the form is valid, or false otherwise.
  if (formKey.currentState!.validate()) {
    // If the form is valid, navigate to the home screen
    loginSuccessful(context);
  }
}

//Method: loginSuccessful: Navigates to the next screen on successful
// form validation
//params: BuildContext
//returns: void
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
