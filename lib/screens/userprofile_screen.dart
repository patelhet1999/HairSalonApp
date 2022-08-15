
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_application/screens/edit_profile_screen.dart';
import 'package:hair_salon_application/screens/my_reviews_screen.dart';
import 'package:hair_salon_application/screens/salon_liked_screen.dart';


import '../models/customer.dart';
import '../server_handler.dart';
import 'apponitment_screen.dart';
import 'introduction_screen.dart';

class UserProfileScreen extends StatefulWidget {

  bool isMale;
  UserProfileScreen({Key? key, required this.isMale,}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  late FirebaseAuth _auth;
  late User? _user;
  bool isFirstExecution = true;
  bool isLoading = false;
  late Customer customer;

  @override
  void initState() {
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    super.initState();
  }

  void getCustomerInformation(String? phoneNumber) async{
    setState(() {
      isLoading = true;
    });
    customer = await ServerHandler().getTheUserInformation(phoneNumber);
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {

    if(isFirstExecution){
      getCustomerInformation(_user!.phoneNumber);
      isFirstExecution = false;
    }

    return isLoading == true? Scaffold(body: Center(child: CircularProgressIndicator(),),) : Scaffold(
      appBar: AppBar(
        leading: Text(""),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("User Profile",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(isMale: widget.isMale,),));
                },
                child: Container(
                  height: 150,
                  margin: EdgeInsets.only(left: 15, right: 15, top: 25),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color.fromRGBO(232, 241, 250, 1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: ClipOval(
                          child: Container(
                            height: 75,
                            width: 75,
                            child: customer.customer_profile_picture == "" ? Image.asset("assets/images/men.jpg", fit: BoxFit.cover,) : Image.network("https://192.168.125.103/hairsalon/assets/${customer.customer_profile_picture}", fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15,),
                                child: Row(
                                  children: [
                                    Text("${customer.customer_full_name}", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15,),
                                child: Row(
                                  children: [
                                    Text("${customer.customer_phone_number}", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width/6 + 20,
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/right-arrow.png",height: 25,width: 25,),
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentScreen(isMale: widget.isMale,), ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 35,bottom: 5,left: 25, right: 25),
                      child: Row(
                        children: [
                          Image.asset("assets/images/calendar_filled.png", height: 30, width: 30,),
                          Container(
                             margin: EdgeInsets.only(left: 15,),
                              child: Text("My Appointments", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400,),),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Divider(),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SalonLikedScreen(isMale: widget.isMale,),));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5,bottom: 5,left: 25, right: 25),
                      child: Row(
                        children: [
                          Image.asset("assets/images/heart.png", height: 30, width: 30,),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text("My Favorities", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400,),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),


                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyReviewsScreen(isMale: widget.isMale, ),));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5,bottom: 5,left: 25, right: 25),
                      child: Row(
                        children: [
                          Image.asset("assets/images/star.png", height: 30, width: 30,),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text("My Reviews", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400,),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),


                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(isMale: widget.isMale,),));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5,bottom: 5,left: 25, right: 25),
                      child: Row(
                        children: [
                          Image.asset("assets/images/user_filled.png", height: 30, width: 30,),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text("Edit Profile", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400,),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),


                  Container(
                    margin: EdgeInsets.only(top: 5,bottom: 5,left: 27, right: 25),
                    child: Row(
                      children: [
                        Image.asset("assets/images/accept.png", height: 30, width: 30,),
                        Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Text("Terms & Conditions", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400,),),
                        ),
                      ],
                    ),
                  ),
                  Divider(),


                  Container(
                    margin: EdgeInsets.only(top: 5,bottom: 5,left: 25, right: 25),
                    child: Row(
                      children: [
                        Image.asset("assets/images/shield.png", height: 30, width: 30,),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text("Privacy Policy", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400,),),
                        ),
                      ],
                    ),
                  ),
                  Divider(),


                  Container(
                    margin: EdgeInsets.only(top: 5,bottom: 5,left: 24, right: 25),
                    child: Row(
                      children: [
                        Image.asset("assets/images/contact_us.png", height: 30, width: 30,),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text("Contact Us", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400,),),
                        ),
                      ],
                    ),
                  ),
                  Divider(),

                  GestureDetector(
                    onTap: () async{
                      await _auth.signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IntroductionScreen(),));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5,bottom: 5,left: 28, right: 25),
                      child: Row(
                        children: [
                          Image.asset("assets/images/log-out.png", height: 30, width: 30,),
                          Container(
                            margin: EdgeInsets.only(left: 13),
                            child: Text("Log Out", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400,),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),

                ],
              ),




            ],
          ),
        ),
      ),
    );
  }
}
