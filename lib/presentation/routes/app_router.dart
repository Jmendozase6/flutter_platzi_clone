import 'package:flutter/material.dart';
import 'package:flutter_platzi_clone/presentation/screens/home_screen.dart';
import 'package:flutter_platzi_clone/presentation/screens/onboarding_screen.dart';
import 'package:flutter_platzi_clone/presentation/screens/sign_in_screen/sign_in_screen.dart';
import 'package:flutter_platzi_clone/presentation/screens/sign_up_screen/sign_up_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String onBoard = '/onBoard';

  static const String signIn = '/signIn';
  static const String signUp = '/signUp';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case onBoard:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      default:
        throw HomeScreen();
    }
  }
}
