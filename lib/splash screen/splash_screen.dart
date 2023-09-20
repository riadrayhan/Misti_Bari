import 'dart:async';
import 'package:flutter/material.dart';
import '../authentication/login.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => SignInScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // child:FlutterLogo(size:MediaQuery.of(context).size.height)
      child: Image.asset('assets/splash.jpg'),
    );
  }
}
