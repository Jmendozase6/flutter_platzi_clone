import 'package:flutter/material.dart';
import 'package:flutter_platzi_clone/presentation/screens/home_screen.dart';
import 'package:flutter_platzi_clone/presentation/screens/onboarding_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String onBoard = '/onBoard';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case onBoard:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      default:
        throw HomeScreen();
    }
  }
}
