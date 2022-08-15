
import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_application/screens/home_screen.dart';
import 'package:hair_salon_application/screens/introduction_screen.dart';
import 'package:hair_salon_application/screens/men_women_selection_screen.dart';
import 'screens/onboarding_screen.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashIconSize: 280,
        duration: 3250,
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.scaleTransition,
          splash: Image.asset('assets/images/logo1.png'),
          nextScreen: InitializerWidget(),
      ),
    );
  }
}

class InitializerWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _InitializerWidgetState();
  }
}

class _InitializerWidgetState extends State<InitializerWidget>{

  late FirebaseAuth _auth;
  late User? _user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true? Scaffold(body: Center(child: CircularProgressIndicator(),),): _user == null? OnBoardingScreen() : MenWomenSelectionScreen();
  }
}



