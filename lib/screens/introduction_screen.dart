

import 'package:flutter/material.dart';
import 'package:hair_salon_application/screens/home_screen.dart';
import 'package:hair_salon_application/screens/men_women_selection_screen.dart';
import 'package:hair_salon_application/screens/user_details_screen.dart';
import 'package:hair_salon_application/screens/userprofile_screen.dart';
import '../server_handler.dart';
import 'phone_and_otp_screen.dart';


class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Stack(
                    children:[
                      Container(
                        color: Colors.white,
                        height: 820,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset("assets/images/otp_screen.png",fit: BoxFit.fill,),
                      ),

                      Positioned(
                        top: 125,
                        left: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [

                                Container(
                                  height: 250,
                                  width: 250,
                                  child: Image.asset("assets/images/mobile_logo.png"),
                                ),

                                Positioned(
                                  top: 180,
                                  left: 80,
                                  child: Text("Hair Salon",
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                Positioned(
                                  top: 210,
                                  left: 22,
                                  child: Text("Book An Appointment At Any Salon",
                                      style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        left: 95,
                        top: 450,
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            gradient:  LinearGradient(
                              colors: [
                                Colors.deepPurple,
                                Color.fromARGB(255, 62, 182, 226)
                              ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                              backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.transparent) ,
                            ),
                            onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Register / Sign in")
                              ],
                            ),
                          ),
                        ),
                      ),

                    ]
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
}
