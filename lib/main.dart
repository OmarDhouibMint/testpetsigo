import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testpetsigo/app.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  var username;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString('Username') == null){
    print("emptyyyy");
    runApp(App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    ));
  }
    else if(prefs.getString('Username') != null){
      username = prefs.getString('Username');
      print("main"+username.toString());
    runApp(App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
      username: username,
    ));
  }

}