import 'package:flutter/material.dart';

import '../models/customer.dart';

class ActiveAppointmentDetailsScreen extends StatefulWidget {

  bool IsMale;
  ActiveAppointmentDetailsScreen({Key? key, required this.IsMale,}) : super(key: key);

  @override
  State<ActiveAppointmentDetailsScreen> createState() => _ActiveAppointmentDetailsScreenState();
}

class _ActiveAppointmentDetailsScreenState extends State<ActiveAppointmentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 30,
                                margin: EdgeInsets.only(bottom: 15,),
                                child: Icon(Icons.arrow_back, color: Colors.white,size: 28,),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                                child: Text("Thu, Sep 17, 2022 at",style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Text("12:30",style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 85,
                              height: 35,
                              margin: EdgeInsets.only(bottom: 25),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Center(child: Text("Active",style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w700),)),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8,),
                              child: Text("Hair Studio",style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8,),
                              child: Text("4650 Greenvilla , Anand",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
                            ),
                          ],
                        ),

                      ],
                    ),
                ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15,bottom: 15,top: 35),
                    child: Text("SERVICES", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 360,
                    margin: EdgeInsets.only(left: 15,bottom: 5,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Hair Cut", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Rs 100", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                Text("30 min", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),

              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 360,
                    margin: EdgeInsets.only(left: 15,bottom: 5,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("BeardTrim", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Rs 100", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                Text("30 min", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),

              Divider(),



              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 360,
                    margin: EdgeInsets.only(left: 15,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Facial", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Rs 100", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                Text("30 min", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),

              Divider(
                color: Colors.black,
                thickness: 1,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 360,
                    margin: EdgeInsets.only(left: 15,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Rs 300", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),


            ]
          ),
        ),
      ),
    );
  }
}
