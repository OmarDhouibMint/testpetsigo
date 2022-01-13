import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testpetsigo/login/login.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController NameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6A4C9A),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Authentication Failure')),
              );
          }
        },
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.white],
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(90),
                          bottomRight: Radius.circular(90))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Spacer(),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/logo_petsigo.png'),
                      ),
                      const Spacer(),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 32, right: 32),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, right: 0),
                    child: Text(
                      'Se connecter',
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  ),
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.username != current.username,
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 50.0,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 80,
                        child: TextField(
                          key: const Key('loginForm_usernameInput_textField'),
                          onChanged: (username) => context
                              .read<LoginBloc>()
                              .add(LoginUsernameChanged(username)),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Username',
                            // labelText: 'username',
                            errorText: state.username.invalid
                                ? 'invalid username'
                                : null,
                          ),
                          controller: NameController,
                        ),
                      ),
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.all(12)),
                _PasswordInput(),
                const Padding(padding: EdgeInsets.all(12)),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) {
                    if (state.status.isSubmissionInProgress) {
                      return const CircularProgressIndicator();
                    } else {
                      return Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: ElevatedButton(
                              key: const Key('loginForm_continue_raisedButton'),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFFDC748),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 15.0,
                              ),
                              child: const Text('Login'),
                              onPressed: state.status.isValidated
                                  ? () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString(
                                          "Username", NameController.text);
                                      print("hellooo" +
                                          prefs.getString("Username").toString());
                                      context
                                          .read<LoginBloc>()
                                          .add(const LoginSubmitted());
                                    }
                                  : null,
                            ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 0.0,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: 80,
            child: TextField(
              key: const Key('loginForm_passwordInput_textField'),
              onChanged: (password) =>
                  context.read<LoginBloc>().add(LoginPasswordChanged(password)),
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: 'Password',
                errorText: state.password.invalid ? 'invalid password' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

