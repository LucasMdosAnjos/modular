import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidy_aula_2/app/shared/auth/auth_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ReactionDisposer disposer;
  @override
  void initState() {
    super.initState();
    autorun((_){
      disposer = autorun((_){
        final auth =Modular.get<AuthController>();
        if(auth.status == AuthStatus.login){
          Modular.to.pushReplacementNamed('/home');
        }else{
          if(auth.status == AuthStatus.logoff){
          Modular.to.pushReplacementNamed('/login');
        }
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
