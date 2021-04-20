import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opencommerce/widgets/login-signup-button.dart';
import 'package:opencommerce/widgets/password-input.dart';
import 'package:opencommerce/widgets/text-input-field.dart';
import 'package:opencommerce/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //build and alert dialog to display some errors
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
              title: Text("Error"),
              content: Container(
                child: Text(error),
              ),
              actions: [
                TextButton(
                  child: Text("Close Dialog"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ]);
        });
  }

  //Create a new user account
  // ignore: missing_return
  Future<String> _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _signInEmail,
        password: _signInPassword,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return 'The password entered is wrong.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      print(e);
    }
  }

  void _submitForm() async {
    //set the form to loading state
    setState(() {
      _signInFormLoading = true;
    });

    //Run the create account method
    String _signInFeedback = await _signIn();

    //If the string i not null, we get error while creating account
    if (_signInFeedback != null) {
      _alertDialogBuilder(_signInFeedback);

      //Set the form to regular state(not loading)
      setState(() {
        _signInFormLoading = false;
      });
    }
  }

  bool _signInFormLoading = false;

  String _signInEmail = '';
  String _signInPassword = '';

  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(image: 'images/bgImage2.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Flexible(
                  child: Center(
                    child: Text(
                      'Fast-Buy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontFamily: 'Akaya Kanadaka',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Column(
                  /*mainAxisAlignment: MainAxisAlignment.end,*/
                  children: [
                    TextInputField(
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      onChanged: (value) {
                        _signInEmail = value;
                      },
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Password',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.done,
                      onChanged: (value) {
                        _signInPassword = value;
                      },
                      focusNode: _passwordFocusNode,
                      onSubmitted: (value) {
                        _submitForm();
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomBtn(
                      text: "Log In",
                      onPressed: () {
                        _submitForm();
                      },
                      isLoading: _signInFormLoading,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, 'ForgotPassword'),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                GoogleSignIn(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'SignUp'),
                    child: Text(
                      'Create New Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
