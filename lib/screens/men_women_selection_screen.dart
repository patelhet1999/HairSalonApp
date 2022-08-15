import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_application/screens/home_screen.dart';
import 'package:hair_salon_application/server_handler.dart';

import '../models/customer.dart';

class MenWomenSelectionScreen extends StatefulWidget{

  MenWomenSelectionScreen({Key? key,}) : super(key: key);


  @override
  State<MenWomenSelectionScreen> createState() => _MenWomenSelectionScreenState();
}

class _MenWomenSelectionScreenState extends State<MenWomenSelectionScreen> {

  late bool _isMale;
  late bool _isFemale;
 
  


  void initState(){
    super.initState();
    _isMale = true;
    _isFemale = false;
  }

  void dispose(){
    _isMale = true;
    _isFemale = false;
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 12, top: 2, bottom: 3),
              child: ClipOval(
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.black12,
                ),
              ),
            ),
          ],
        ),
        toolbarHeight: 70
        ,
        actions: [
          SizedBox(
            width: 10,
          ),
          Container(
            child: Center(child: Image.asset('assets/images/heart.png',height: 28, width: 28,)),
          ),
          SizedBox(width: 12,),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width:  MediaQuery.of(context).size.width,
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Container(
                height: 335,
                width: 580,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("You are Looking For...",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                    ),
                    Divider(color: Colors.black,thickness: 1),

                    Container(
                      margin: EdgeInsets.only(top: 30, left: 35,),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState((){
                                _isMale = true;
                                _isFemale = false;
                              });
                            },
                            child: Container(
                              height: 110,
                              width: 110,
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/men.jpg'),
                                backgroundColor: Colors.grey.shade300,
                                radius: 25,
                              ),
                            ),
                          ),

                          SizedBox(width: 25,),

                          GestureDetector(
                            onTap: (){
                              setState((){
                                _isFemale = true;
                                _isMale = false;
                              });
                            },
                            child: Container(
                              height: 110,
                              width: 110,
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/women.jpg'),
                                backgroundColor: Colors.grey.shade300,
                                radius: 25,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ),

                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 70, top: 10,),
                          child: Text("Male", style: TextStyle(color: _isMale == true ? Colors.cyan : Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 85, top: 10,),
                          child: Text("Female", style: TextStyle(color: _isFemale == true ? Colors.cyan : Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),

                    Container(
                      height: 40,
                      width: 200,
                      margin: EdgeInsets.only(top: 30,),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(isMale: _isMale,)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Let's Go"),
                          ],
                        ),
                      ),
                    ),



                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}