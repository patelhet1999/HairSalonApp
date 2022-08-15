import 'package:flutter/material.dart';

import '../models/customer.dart';

class MyReviewsScreen extends StatefulWidget {
  bool isMale;

  MyReviewsScreen({Key? key, required this.isMale, }) : super(key: key);

  @override
  State<MyReviewsScreen> createState() => _MyReviewsScreenState();
}

class _MyReviewsScreenState extends State<MyReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("My Reviews",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 1000,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(top: 20, left: 15, right: 15,bottom: 12),
                    height: 230,
                    width: 370,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(232, 241, 250, 1),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15,top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Thu, Sep 17, 2022",style: TextStyle(color:  Colors.black54, fontSize: 14, fontWeight: FontWeight.w700),),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15,top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                margin: EdgeInsets.only(right: 10,),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10),topRight: Radius.circular(10), bottomRight: Radius.circular(10),)
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10),topRight: Radius.circular(10), bottomRight: Radius.circular(10),),
                                    child: Image.asset("assets/images/my_review_salon.png", fit: BoxFit.cover)),
                                // child: Image.asset("assets/images/logo1.png",)
                              ),

                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 6),
                                      child: Text("Hair Studio", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                                    ),

                                    Container(
                                      margin: EdgeInsets.only(bottom: 6),
                                      child: Text("404 A-One, Anand", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54,),),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 15,right: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset("assets/images/star.png"),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset("assets/images/star.png"),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset("assets/images/star.png"),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset("assets/images/star.png"),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset("assets/images/star.png"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15,right: 15,top: 15,),
                              child: Text("Great Service, Very Sanitary!", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 14),),
                            ),
                          ],
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
