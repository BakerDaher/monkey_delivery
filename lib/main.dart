import 'package:flutter/material.dart';
import 'package:monkey_delivery/helper/app_routes.dart';
import 'package:monkey_delivery/helper/constant/String.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp( MyApp(appRouter: AppRouter()));

}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  const MyApp({Key? key , required this.appRouter}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) => {
      FlutterNativeSplash.remove()
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Colors.deepOrangeAccent ,
        primarySwatch: Colors.deepOrange,
      ),
      onGenerateRoute: widget.appRouter.generateRoute ,
      initialRoute: onbordingScreen ,
    );
  }
}
