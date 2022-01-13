import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testpetsigo/authentication/authentication.dart';
import 'package:testpetsigo/home/home.dart';
import 'package:testpetsigo/login/login.dart';
import 'package:testpetsigo/splash/splash.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  var username;
   App({
    Key? key,
    required this.authenticationRepository,
    required this.userRepository,
    this.username,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;


  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        ),
        child: AppView(username: username),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  AppView({
    Key? key,
    this.username,
  }) : super(key: key);
  var username;
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
          /*  switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                      (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                      (route) => false,
                );
                break;
              default:
                break;
            }*/
            if ((widget.username != null)){
              print("heree!");
              _navigator.pushAndRemoveUntil<void>(
                  MaterialPageRoute(builder: (context) =>
                      HomePage(username: widget.username)), (Route<dynamic> route) => false
              );
            }
            else if ((widget.username == null)){
              print("heree0!");
              _navigator.pushAndRemoveUntil<void>(
                LoginPage.route(),
                    (route) => false,
              );
            }
            else {
              print("heree88!"+widget.username.toString());
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
