import 'package:flutter/material.dart';
import 'package:hair_salon_application/screens/salon_screen.dart';

import '../models/customer.dart';

class SalonLikedScreen extends StatefulWidget {
  bool isMale;

  SalonLikedScreen({Key? key, required this.isMale, }) : super(key: key);

  @override
  State<SalonLikedScreen> createState() => _SalonLikedScreenState();
}

class _SalonLikedScreenState extends State<SalonLikedScreen> {

  bool isSalonLiked = true;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("My Favorites",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15,),

              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 12,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalonScreen(isMale: widget.isMale,),));
                    },
                    child: Container(
                      height: 100,
                      width: 400,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(232, 241, 250, 1),
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
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                child: Image.asset("assets/images/salon_list.png", fit: BoxFit.cover,)),
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

                          if(isSalonLiked == true)
                            GestureDetector(
                              onTap: (){
                                setState((){
                                  isSalonLiked = false;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 80,),
                                child: Center(child: Image.asset('assets/images/heart.png',height: 28, width: 28,)),
                              ),
                            ),


                          if(isSalonLiked == false)
                            GestureDetector(
                              onTap: (){
                                setState((){
                                  isSalonLiked = true;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 80,),
                                child: Center(child: Image.asset('assets/images/heart_unliked.png',height: 28, width: 28,)),
                              ),
                            ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

