import 'package:flutter/material.dart';
import 'package:hair_salon_application/screens/salon_screen.dart';

import '../models/customer.dart';

class RatingScreen extends StatefulWidget {
  bool isMale;

  RatingScreen({Key? key, required this.isMale,}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Rate Your Experience",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalonScreen(isMale: widget.isMale,),));
              },
              child: Container(
                height: 100,
                width: 400,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: 100,
                      margin: EdgeInsets.only(right: 10,),
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                      ),
                      // child: Image.asset("assets/images/logo1.png",)
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Text("Hair Studio", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Text("404 A-One, Anand", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),),
                          ),

                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                child: Image.asset("assets/images/star.png", color: Colors.black,),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 3,left: 2),
                                child:  Text("4.9",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 3,),
                                child:  Text(" "),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 3,),
                                child: Text("(98 reviews)", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8,left: 15),
                  child: Text("WHAT IS YOUR RATE?",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.only(left: 15, bottom: 15, top: 5,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/star.png", height: 30, width: 30,),
                      Image.asset("assets/images/star.png", height: 30, width: 30,),
                      Image.asset("assets/images/star.png", height: 30, width: 30,),
                      Image.asset("assets/images/star.png", height: 30, width: 30,),
                      Image.asset("assets/images/star.png", height: 30, width: 30,),
                    ],
                  ),
                  Text("5.0",style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w700),),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8,left: 15,top: 30),
                  child: Text("YOUR COMMENT (OPTIONAL)",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),),
                ),
              ],
            ),

            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 15, right: 15,top:10,),
              child: TextField(
                maxLines: 15,
                autofocus: false,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  fillColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.black,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.black,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.black,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.black,
                    ),
                  ),
                  hintText: "Enter your comment here....",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
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
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Submit Review")
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
