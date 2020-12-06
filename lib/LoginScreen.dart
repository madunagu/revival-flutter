import 'package:devotion/blocs/authentication.bloc.dart';
import 'package:devotion/blocs/login.bloc.dart';
import 'package:devotion/events/LoginEvent.dart';
import 'package:devotion/repositories/UserRepository.dart';
import 'package:devotion/states/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  LoginScreen({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    const tabStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12);
    const purpleColor = Color(0xff8a56ac);
    const inputPadding = EdgeInsets.only(left: 0, top: 35, bottom: 7, right: 0);

    return Scaffold(
      backgroundColor: Color(0xfff1f0f2),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 700,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 269,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                        ),
                        color: purpleColor),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'SIGN IN',
                        style: tabStyle,
                      ),
                      SizedBox(
                        width: 57,
                      ),
                      Text(
                        'SIGN UP',
                        style: tabStyle,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 91,
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: LoginForm(
                      inputPadding: inputPadding, purpleColor: purpleColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
    @required this.inputPadding,
    @required this.purpleColor,
  }) : super(key: key);

  final EdgeInsets inputPadding;
  final Color purpleColor;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 271,
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                            contentPadding: widget.inputPadding,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.red,
                              ),
                            ),
                            hintText: 'Email',),
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: widget.inputPadding,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.red,
                              ),
                            ),
                            hintText: 'Password'),
                      ),
                      SizedBox(
                        height: 54,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap:
                      state is! LoginInProgress ? _onLoginButtonPressed : null,
                  child: Container(
                    height: 52,
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(82),
                      color: widget.purpleColor,
                    ),
                    child: Center(
                      child: Text(
                        'CONTINUE',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: state is LoginInProgress
                      ? CircularProgressIndicator()
                      : null,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
