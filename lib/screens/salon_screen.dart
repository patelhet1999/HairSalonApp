import 'dart:async';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hair_salon_application/models/customer.dart';
import 'package:hair_salon_application/screens/book_appointment_screen.dart';
import 'package:hair_salon_application/screens/salon_reviews_screen.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/salon.dart';

class SalonScreen extends StatefulWidget{
  bool isMale;
  SalonScreen({Key? key, required this.isMale,}) : super(key: key);

  @override
  State<SalonScreen> createState() => _SalonScreenState();
}

class _SalonScreenState extends State<SalonScreen> {

  late bool _showHours;
  double? _sizeOfReadMoreText;
  int nearbyLocationActiveIndex = 0;
  bool isSalonLiked = true;
  String _websiteUrl = 'https://flutter.dev';
  String _phoneNumber = '+919574192919';
  String address = "6391 Greenvilla House, Anand , 388120";
  late String latitude;
  late String longitude;

  @override
  void initState() {
    super.initState();
    _showHours = false;
    _sizeOfReadMoreText = 60;
    getLocationOfUser();
  }

  @override
  void dispose(){
    _showHours = false;
    _sizeOfReadMoreText = 60;
    super.dispose();
  }


  void getLocationOfUser() async{
    Position position = await _determinePosition();
    latitude = position.latitude.toString();
    longitude = position.longitude.toString();
    print("latitude : ${position.latitude}, longitude: ${position.longitude}");
    List<Placemark> placeMark = await getUserAddressThroughLatitudeAndLongitude(position);
    Placemark _placemark = placeMark[0];
    setState((){
      address = "${_placemark.name}, ${_placemark.subAdministrativeArea}, ${_placemark.postalCode}";
    });
  }


  Future<List<Placemark>> getUserAddressThroughLatitudeAndLongitude(Position position) async{
    List<Placemark> placeMark = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placeMark[0]);
    return placeMark;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  spreadRadius: 1.0,
                  blurRadius: 10.0,
                  offset: Offset(3.0, 3.0))
            ],
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 6,
                left: 110,
                child: Container(
                height: 40,
                width: 180,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookAppointmentScreen(isMale: widget.isMale,),));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Book Appointment")
                    ],
                  ),
                ),
            ),
              ),
           ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              expandedHeight: 250,
              leading: Icon(Icons.arrow_back, size: 30,color: Colors.black,),
              actions: [
                if(isSalonLiked == true)
                GestureDetector(
                  onTap: (){
                    setState((){
                      isSalonLiked = false;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 18,left: 15,),
                      child: Image.asset("assets/images/heart.png", height: 25,width: 25,color: Colors.black,),
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
                      margin: EdgeInsets.only(right: 18,left: 15,),
                      child: Image.asset("assets/images/heart.png", height: 25,width: 25,color: Colors.black,),
                    ),
                  ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                    children:[
                      Container(
                        height: 250,
                        width: 500,
                          child: Image.asset("assets/images/salon.jpg", fit: BoxFit.cover,)),
                      Positioned(
                        top: 180,
                        left: 250,
                        child: Container(
                          padding: EdgeInsets.only(top: 8),
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                             color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Column(
                            children: [
                              Text("4.9",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                              Text("98 reviews", style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 15),
                            child: Text("A-One Salon", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,),),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async{
                        var googleUrl = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
                        if (!await launch(googleUrl)) throw 'Could not launch $googleUrl';
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 15),
                            child: Icon(Icons.location_on, color: Colors.black, size: 18,),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text("Petlad, Anand", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,color: Colors.grey,),),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            if(_showHours == true){
                              setState((){
                                _showHours = false;
                              });
                            }
                            else{
                              setState((){
                                _showHours = true;
                              });
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 15,right: 15,top: 18,bottom: 10),
                            height: 40,
                            width: 360,
                            child: Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade200,
                                  ),
                                    child: Icon(Icons.access_time,size: 28,),
                                ),

                                SizedBox(
                                  width: 5,
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5, top: 2),
                                        child: Text("Working hours", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5, top: 1,bottom: 2),
                                        child: Text("08:00 - 20:00", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  width: 190,
                                ),

                                Container(
                                  child: _showHours == false ? Image.asset("assets/images/arrow-down.png",width: 20,height: 20,) : Image.asset("assets/images/up-arrow.png",width: 20,height: 20,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    if(_showHours == true)
                   Container(
                     margin: EdgeInsets.only(left: 15, right: 15,top: 15, bottom: 15) ,
                     child: Column(
                       children: [
                         Container(
                           margin: EdgeInsets.only(bottom: 8),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Monday"),
                               Text("08:00 - 20.00"),
                             ],
                           ),
                         ),

                         Container(
                           margin: EdgeInsets.only(bottom: 8),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Tuesday"),
                               Text("08:00 - 20.00"),
                             ],
                           ),
                         ),

                         Container(
                           margin: EdgeInsets.only(bottom: 8),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Wednesday"),
                               Text("08:00 - 20.00"),
                             ],
                           ),
                         ),

                         Container(
                           margin: EdgeInsets.only(bottom: 8),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Thursday"),
                               Text("08:00 - 20.00"),
                             ],
                           ),
                         ),

                         Container(
                           margin: EdgeInsets.only(bottom: 8),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Friday"),
                               Text("08:00 - 20.00"),
                             ],
                           ),
                         ),

                         Container(
                           margin: EdgeInsets.only(bottom: 8),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Saturday"),
                               Text("Closed"),
                             ],
                           ),
                         ),

                         Container(
                           margin: EdgeInsets.only(bottom: 8),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("Sunday"),
                               Text("Closed"),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),


                    GestureDetector(
                      onTap: () async{
                        var _phoneNumberUrl = 'tel:${_phoneNumber}';
                        if (!await launch(_phoneNumberUrl)) throw 'Could not launch $_phoneNumberUrl';
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                            height: 40,
                            width: 360,
                            child: Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Icon(Icons.phone,size: 28,),
                                ),

                                SizedBox(
                                  width: 5,
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5, top: 2),
                                      child: Text("Phone Number", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5, top: 1,bottom: 2),
                                      child: Text("+919574192919", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                          height: 40,
                          width: 360,
                          child: Row(
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade200,
                                ),
                                child: Image.asset("assets/images/earth.png"),
                              ),

                              SizedBox(
                                width: 5,
                              ),

                              GestureDetector(
                                onTap: () async{
                                  if (!await launch(_websiteUrl)) throw 'Could not launch $_websiteUrl';
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5, top: 2),
                                      child: Text("Web", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5, top: 1,bottom: 2),
                                      child: Text("${_websiteUrl}",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                          height: 40,
                          width: 360,
                          child: Row(
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade200,
                                ),
                                child: Image.asset("assets/images/group.png"),
                              ),

                              SizedBox(
                                width: 5,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5, top: 2),
                                    child: Text("Genders", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, top: 1,bottom: 2),
                                    child: Text("Male only", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, top:25, bottom: 25,),
                            child: Text("ABOUT US", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15,),
                          height:  _sizeOfReadMoreText,
                          width: 360,
                          child: GestureDetector(
                            onTap: (){
                              print("hello");
                            },
                            child: ReadMoreText(
                              "At the our salon, we have confidence in excellence with a heart. We have made a salon that offers the most noteworthy quality hair benefits in a setting that is more advantageous for the earth, our visitors, and our staff",
                              callback: (value){
                                print(value);
                                if(value == false){
                                  setState((){
                                    _sizeOfReadMoreText = 80;
                                  });
                                }
                                else{
                                  print(value);
                                  setState((){
                                    _sizeOfReadMoreText = 50;
                                  });
                                }
                              },
                              trimMode: TrimMode.Line,
                              trimLines: 3,
                              trimExpandedText: "Read Less",
                              trimCollapsedText: "Read More",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, top:30, bottom: 15,),
                          child: Text("OUR STAFF", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),
                        ),
                      ],
                    ),

                    Container(
                      height: 126,
                      child: ListView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    color: Colors.grey.shade300,
                                    image: DecorationImage(image: AssetImage("assets/images/hair_artist.png"),fit: BoxFit.cover),
                                  ),),

                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Jinesh Patel", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),),
                                    ],
                                  ),
                                ),

                              ],
                            );
                          },
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

                    Divider(),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 6,),
                          child: TextButton(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookAppointmentScreen(isMale: widget.isMale,),));
                              },
                              child: Text("See all Services", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, top:30, bottom: 15,),
                          child: Text("REVIEWS", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),
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
                              child: Text("Highly Recommended!", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 14),),
                            ),
                          ],
                        ),
                      ],
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 6,),
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SalonReviewsScreen(isMale: widget.isMale,),));
                            },
                            child: Text("See all Reviews", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, top:30, bottom: 15,),
                          child: Text("Nearby Locations", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),

                    CarouselSlider.builder(
                      itemCount: 5,
                      itemBuilder: (context, index, realIndex){
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalonScreen(isMale: widget.isMale),));
                          },
                          child: Stack(
                            children:[
                              Container(
                                margin: EdgeInsets.only(left: 12, right: 12,),
                                height: 800,
                                width: 400,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.all(Radius.circular(18)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12, right: 12,),
                                height: 180,
                                width: 400,
                                decoration: BoxDecoration(
                                  color:  Colors.grey.shade300,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18), ),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18), ),
                                    child: Image.asset("assets/images/salon6.png", fit: BoxFit.cover,)),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(left: 12, right: 12,),
                                  height:70,
                                  width: 369,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(232, 241, 250, 1),
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18), bottomRight: Radius.circular(18), ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Hair Studio", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                          Text("404 A-One, Anand", style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w600),),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children: [
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
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        initialPage: 0,
                        onPageChanged: (index, reason){
                          setState((){nearbyLocationActiveIndex = index;});
                        },
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        height: 250,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 8, bottom: 40),
                      child: AnimatedSmoothIndicator(
                        activeIndex: nearbyLocationActiveIndex,
                        count: 5,
                        effect: WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          dotColor: Colors.black12,
                          activeDotColor: Colors.blue,
                        ),
                      ),
                    ),

                    SizedBox(height: 50,),

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