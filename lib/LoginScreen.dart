import 'package:devotion/bloc/blocs/authentication.bloc.dart';
import 'package:devotion/bloc/blocs/login.bloc.dart';
import 'package:devotion/bloc/events/LoginEvent.dart';
import 'package:devotion/bloc/states/LoginState.dart';
import 'package:devotion/repositories/UserRepository.dart';
import 'package:devotion/widgets/AppButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final EdgeInsetsGeometry inputPadding = EdgeInsets.only(top: 0, bottom: 0);
final Color purpleColor = const Color(0xff8a56ac);
final InputBorder inputBorder = const UnderlineInputBorder(
  borderSide: BorderSide(
    style: BorderStyle.solid,
    color: Color(0xffdddddd),
  ),
);
final InputBorder focusBorder = const UnderlineInputBorder(
  borderSide: BorderSide(
    style: BorderStyle.solid,
    width: 2,
    color: Color(0xff352641),
  ),
);
final TextStyle hintStyle = const TextStyle(
  color: Color(0x5c241332),
  fontWeight: FontWeight.w500,
  height: 20 / 16,
  letterSpacing: 0.1,
);

class LoginScreen extends StatefulWidget {
  final UserRepository userRepository;

  LoginScreen({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfff1f0f2),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: widget.userRepository,
          );
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 0,
              height: 269,
              width: size.width,
              child: Container(
                height: 269,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                  ),
                  color: purpleColor,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              width: size.width,
              height: size.height,
              child: Container(
                width: size.width,
                height: size.height,
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    LoginTabs(tabController: _tabController),
                    SizedBox(height: 15),
                    Container(
                      width: size.width,
                      height: size.height - 117,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(child: LoginForm()),
                          SingleChildScrollView(child: RegisterForm()),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginTabs extends StatefulWidget {
  const LoginTabs({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  _LoginTabsState createState() => _LoginTabsState();
}

class _LoginTabsState extends State<LoginTabs> {
  final TextStyle tabStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.04,
    fontSize: 12,
    height: 26 / 12,
  );
  @override
  void initState() {
    // TODO: implement initState
    widget._tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              widget._tabController
                  .animateTo(0);
            });
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'SIGN IN',
              style: widget._tabController.index == 0
                  ? tabStyle
                  : tabStyle.copyWith(
                      color: Color(0x99ffffff),
                    ),
            ),
          ),
        ),
        SizedBox(
          width: 57,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget._tabController
                  .animateTo(1);
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'SIGN UP',
              style: widget._tabController.index == 1
                  ? tabStyle
                  : tabStyle.copyWith(color: Color(0x99ffffff)),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

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
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      TextField(
                        controller: _usernameController,
                        style: hintStyle.copyWith(color: Color(0xff352641)),
                        decoration: InputDecoration(
                          contentPadding: inputPadding,
                          enabledBorder: inputBorder,
                          focusedBorder: focusBorder,
                          hintText: 'Email',
                          hintStyle: hintStyle,
                        ),
                      ),
                      SizedBox(height: 42),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: hintStyle.copyWith(
                            color: Color(0xff352641), letterSpacing: 4),
                        decoration: InputDecoration(
                          contentPadding: inputPadding,
                          enabledBorder: inputBorder,
                          focusedBorder: focusBorder,
                          hintText: 'Password',
                          hintStyle: hintStyle,
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                AppButtonWidget(
                  onTap:
                      state is! LoginInProgress ? _onLoginButtonPressed : null,
                  text: 'CONTINUE',
                  color: purpleColor,
                  height: 52,
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

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key key,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onRegisterButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        RegisterButtonPressed(
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
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
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          contentPadding: inputPadding,
                          enabledBorder: inputBorder,
                          focusedBorder: focusBorder,
                          hintText: 'Name',
                          hintStyle: hintStyle,
                        ),
                      ),
                      SizedBox(height: 42),
                      TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          contentPadding: inputPadding,
                          enabledBorder: inputBorder,
                          focusedBorder: focusBorder,
                          hintStyle: hintStyle,
                          hintText: 'Phone',
                        ),
                      ),
                      SizedBox(height: 42),
                      TextField(
                        controller: _emailController,
                        style: hintStyle.copyWith(color: Color(0xff352641)),
                        decoration: InputDecoration(
                          contentPadding: inputPadding,
                          enabledBorder: inputBorder,
                          focusedBorder: focusBorder,
                          hintStyle: hintStyle,
                          hintText: 'Email',
                        ),
                      ),
                      SizedBox(height: 22),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                AppButtonWidget(
                  onTap: state is! LoginInProgress
                      ? _onRegisterButtonPressed
                      : null,
                  text: 'CONTINUE',
                  color: purpleColor,
                  height: 52,
                ),
                SizedBox(height:50),
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
