import 'package:flutter/material.dart';
import 'package:monkey_delivery/presentation/Screen/NewPassScreen.dart';
import 'package:monkey_delivery/presentation/Screen/OTPScreen..dart';
import 'package:monkey_delivery/presentation/Screen/Onbording.dart';
import 'package:monkey_delivery/presentation/Screen/HomeScreen.dart';
import 'package:monkey_delivery/presentation/Screen/LoginScreen.dart';
import 'package:monkey_delivery/presentation/Screen/SinupScreen.dart';
import 'package:monkey_delivery/presentation/Screen/ResetScreen.dart';
import 'package:monkey_delivery/presentation/Screen/SplashScreen.dart';
import 'package:monkey_delivery/helper/constant/String.dart';

class AppRouter{
  Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case onbordingScreen:
        return MaterialPageRoute(builder: (_) => const OnbordingScreen() );
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case sinupScreen :
        return MaterialPageRoute(builder: (_) => const SinupScreen() );
      case resetScreen :
        return MaterialPageRoute(builder: (_) => const ResetScreen() );
      case splashScreen :
        return MaterialPageRoute(builder: (_) => const SplashScreen() );
      case homeScreen :
        return MaterialPageRoute(builder: (_) => const HomeScreen() );
      case oTPScreen :
        return MaterialPageRoute(builder: (_) => const OTPScreen() );
      case newPassScreen :
        return MaterialPageRoute(builder: (_) => const NewPassScreen() );
    }
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Text("no route defined"),
      ),
    );
  }
}