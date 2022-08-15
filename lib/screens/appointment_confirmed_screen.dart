import 'package:flutter/material.dart';
import 'package:hair_salon_application/screens/apponitment_screen.dart';
import 'package:hair_salon_application/screens/home_screen.dart';
import 'package:hair_salon_application/screens/userprofile_screen.dart';

import '../models/customer.dart';

class AppointmentConfirmedScreen extends StatefulWidget{

  bool isMale;
  AppointmentConfirmedScreen({Key? key, required this.isMale,}) : super(key: key);

  @override
  State<AppointmentConfirmedScreen> createState() => _AppointmentConfirmedScreenState();
}

class _AppointmentConfirmedScreenState extends State<AppointmentConfirmedScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 260,),
                  height: 130,
                  width: 130,
                  child: Image.asset("assets/images/calendar.png", color: Colors.blue,),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text("APPOINTMENT CONFIRMED",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text("You don' need to do anything else. We are glad ",),
                      Text("to book your seat and Hope you will",),
                      Text("satisfy from our services.",),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 365,
                  margin: EdgeInsets.only(top: 240,),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(isMale: widget.isMale,),));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("OK, GOT IT")
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}