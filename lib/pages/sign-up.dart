import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opencommerce/widgets/password-input.dart';
import 'package:opencommerce/widgets/text-input-field.dart';
import 'package:opencommerce/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
  Future<String> _signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _registerEmail,
        password: _registerPassword,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
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
      _signUpFormLoading = true;
    });

    //Run the create account method
    String _createAccountFeedback = await _signUp();

    //If the string is not null, we get error while creating account
    if (_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);

      //Set the form to regular state(not loading)
      setState(() {
        _signUpFormLoading = false;
      });
    }else{
      //The string was null, user is logged in
      Navigator.pop(context);
    }
  }

  bool _signUpFormLoading = false;

  String _registerEmail = '';
  String _registerPassword = '';

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
                        _registerEmail = value;
                      },
                    ),
                    PasswordInput(
                        icon: FontAwesomeIcons.lock,
                        hint: 'Password',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.done,
                        onChanged: (value) {
                          _registerPassword = value;
                        },
                        focusNode: _passwordFocusNode,
                        onSubmitted: (value) {
                          _submitForm();
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    CustomBtn(
                      text: "Sign Up",
                      onPressed: () {
                        _submitForm();
                      },
                      isLoading: _signUpFormLoading,
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
