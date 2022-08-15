import 'package:flutter/material.dart';
import 'package:hair_salon_application/models/customer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SalonReviewsScreen extends StatefulWidget {
  bool isMale;

  SalonReviewsScreen({Key? key, required this.isMale, }) : super(key: key);

  @override
  State<SalonReviewsScreen> createState() => _SalonReviewsScreenState();
}

class _SalonReviewsScreenState extends State<SalonReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector( onTap: (){Navigator.of(context).pop();},child: Icon(Icons.arrow_back, color: Colors.black,size: 28)),
        backgroundColor: Colors.white,
        title: Text("Reviews",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 30,right: 15),
                  child: Text("Hair Studio", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,),),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 35,right: 15),
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

                Container(
                  margin: EdgeInsets.only(left: 15, top: 35,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("4.9",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),),
                      Text("98 reviews", style: TextStyle(color: Colors.black, fontSize: 16),),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 40,right: 15),
                  child: Text("RATINGS", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 20,right: 15),
                  child: Row(
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 175,
                  margin: EdgeInsets.only(left: 15, top: 20,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StepProgressIndicator(
                        totalSteps: 100,
                        currentStep: 60,
                        size: 8,
                        padding: 0,
                        selectedColor: Colors.blue,
                        unselectedColor: Colors.grey,
                        roundedEdges: Radius.circular(10),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left:3, top: 20,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("5", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 20,right: 15),
                  child: Row(
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/unfilled_star.png"),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 175,
                  margin: EdgeInsets.only(left: 15, top: 20,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StepProgressIndicator(
                        totalSteps: 100,
                        currentStep: 70,
                        size: 8,
                        padding: 0,
                        selectedColor: Colors.blue,
                        unselectedColor: Colors.grey,
                        roundedEdges: Radius.circular(10),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left:3, top: 20,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("8", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 20,right: 15),
                  child: Row(
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/unfilled_star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/unfilled_star.png"),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 175,
                  margin: EdgeInsets.only(left: 15, top: 20,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StepProgressIndicator(
                        totalSteps: 100,
                        currentStep: 0,
                        size: 8,
                        padding: 0,
                        selectedColor: Colors.blue,
                        unselectedColor: Colors.grey,
                        roundedEdges: Radius.circular(10),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left:3, top: 20,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("0", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 20,right: 15),
                  child: Row(
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/unfilled_star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/unfilled_star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/unfilled_star.png"),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 175,
                  margin: EdgeInsets.only(left: 15, top: 20,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StepProgressIndicator(
                        totalSteps: 100,
                        currentStep: 80,
                        size: 8,
                        padding: 0,
                        selectedColor: Colors.blue,
                        unselectedColor: Colors.grey,
                        roundedEdges: Radius.circular(10),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left:3, top: 20,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("6", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 20,right: 15),
                  child: Row(
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/unfilled_star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/unfilled_star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/unfilled_star.png"),
                      ),
                      Container(
                        height: 22,
                        width: 22,
                        child: Image.asset("assets/images/unfilled_star.png"),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 175,
                  margin: EdgeInsets.only(left: 15, top: 20,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StepProgressIndicator(
                        totalSteps: 100,
                        currentStep: 32,
                        size: 8,
                        padding: 0,
                        selectedColor: Colors.blue,
                        unselectedColor: Colors.grey,
                        roundedEdges: Radius.circular(10),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left:3, top: 20,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("3", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 18),
                      height: 80,
                      width: 360,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/men.jpg'),
                                    backgroundColor: Colors.grey.shade300,
                                    radius: 25,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("Het Patel", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("Jan 26, 2022", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text("Great Service, Very Sanitary!", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 14),),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      height: 80,
                      width: 360,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/men.jpg'),
                                    backgroundColor: Colors.grey.shade300,
                                    radius: 25,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("Het Patel", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("Jan 26, 2022", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text("Great Service, Very Sanitary!", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 14),),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      height: 80,
                      width: 360,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/men.jpg'),
                                    backgroundColor: Colors.grey.shade300,
                                    radius: 25,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("Het Patel", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("Jan 26, 2022", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text("Great Service, Very Sanitary!", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 14),),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      height: 80,
                      width: 360,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/men.jpg'),
                                    backgroundColor: Colors.grey.shade300,
                                    radius: 25,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("Het Patel", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("Jan 26, 2022", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text("Great Service, Very Sanitary!", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 14),),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      height: 80,
                      width: 360,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/men.jpg'),
                                    backgroundColor: Colors.grey.shade300,
                                    radius: 25,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("Het Patel", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("Jan 26, 2022", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset("assets/images/star.png"),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text("Great Service, Very Sanitary!", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 14),),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 50,
            ),


          ],
        ),
      ),
    );
  }
}
