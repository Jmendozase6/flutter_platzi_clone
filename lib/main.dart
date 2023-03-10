import 'package:flutter/material.dart';
import 'package:flutter_platzi_clone/presentation/routes/app_router.dart';
import 'package:flutter_platzi_clone/utils/notifiers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: providers,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Platzi Clone',
            initialRoute: AppRouter.onBoard,
            onGenerateRoute: AppRouter.onGenerateRoute,
            theme: ThemeData(
              fontFamily: 'Gilroy',
            ),
          ),
        );
      },
    );
  }
}
