import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testpetsigo/authentication/authentication.dart';
import 'package:testpetsigo/login/view/login_page.dart';

class HomePage extends StatelessWidget {
  var username;
  HomePage({
    this.username,
  });
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                final userId = context.select(
                  (AuthenticationBloc bloc) => bloc.state.user.id,
                );
                return Text('User name: '+username);
              },
            ),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove("Username");
                Navigator.of(context).pushAndRemoveUntil<void>(
                    MaterialPageRoute(builder: (context) =>
                        LoginPage()), (Route<dynamic> route) => false
                );
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
