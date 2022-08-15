
import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hair_salon_application/screens/apponitment_screen.dart';
import 'package:hair_salon_application/screens/introduction_screen.dart';
import 'package:hair_salon_application/screens/list_of_salons.dart';
import 'package:hair_salon_application/screens/salon_liked_screen.dart';
import 'package:hair_salon_application/screens/salon_screen.dart';
import 'package:hair_salon_application/screens/search_screen.dart';
import 'package:hair_salon_application/screens/userprofile_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/customer.dart';
import '../models/salon.dart';
import '../server_handler.dart';

class HomeScreen extends StatefulWidget{

  bool isMale;
  HomeScreen({Key? key,required this.isMale,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String address = "6391 Greenvilla House, Anand , 388120";

  bool isLoading = false;
  late FirebaseAuth _auth;
  late User? _user;
  bool isFirstExecution = true;
  late Customer customer;



  @override
  void initState() {
   getLocationOfUser();
   _auth = FirebaseAuth.instance;
   _user = _auth.currentUser;
   super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  void getLocationOfUser() async{
    Position position = await _determinePosition();
    print("latitude : ${position.latitude}, longitude: ${position.longitude}");
     List<Placemark> placeMark = await getUserAddressThroughLatitudeAndLongitude(position);
     Placemark _placemark = placeMark[0];
     print(_placemark);
     setState((){
       address = "${_placemark.locality}, ${_placemark.subAdministrativeArea}, ${_placemark.postalCode}";
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

  List<Widget> iconList = [
    Icon(Icons.home, size: 30,),
    Icon(Icons.search, size: 30,),
    Icon(Icons.calendar_today, size: 30,),
    Icon(Icons.person, size: 30,),
  ];

  List<String> maleServiceIconUrl = [
    "assets/images/scissor.png",
    "assets/images/trimmer.png",
    "assets/images/facial-foam.png",
    "assets/images/hair-care.png",
    "assets/images/hair.png",
    "assets/images/massage.png",
    "assets/images/skin-care.png",
  ];

  List<String> femaleServiceIconUrl = [
    "assets/images/scissor.png",
    "assets/images/make-up.png",
    "assets/images/facial-foam.png",
    "assets/images/hair-care.png",
    "assets/images/hair.png",
    "assets/images/massage.png",
    "assets/images/skin-care.png",
  ];

  List<String> maleServiceName = [
    "Hair Cut",
    "Beard T..",
    "   Facial",
    "   Color",
    "Hair Tre..",
    "Massage",
    "Skin Tre..",
  ];

  List<String> femaleServiceName = [
    "Hair Cut",
    "Makeup",
    "   Facial",
    "   Color",
    "Hair Tre..",
    "Massage",
    "Skin Tre..",
  ];
  GlobalKey<CurvedNavigationBarState> navigationBarKey = GlobalKey<CurvedNavigationBarState>();

  var scaffoldStateKey = GlobalKey<ScaffoldState>();

  int currentIndexOfButton = 0;

  int topRatedActiveIndex = 0;
  int recentlyActiveIndex = 0;
  int offersActiveIndex = 0;
  late List<Salon> salonList;


  Future getCustomerInformation(String? phoneNumber) async{
    setState(() {
      isLoading = true;
    });
    customer = await ServerHandler().getTheUserInformation(phoneNumber);
    setState(() {
      isLoading = false;
    });
  }

  Future getPopularSalons() async{
    setState(() {
      isLoading = true;
    });
    salonList = await ServerHandler().getPopularSalons();
    print("${salonList}  On line 176 ");
    print(salonList[0]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    if(isFirstExecution){
      getCustomerInformation(_user!.phoneNumber);
      getPopularSalons();
      isFirstExecution = false;
    }

    return isLoading == true ? Scaffold(body: Center(child: CircularProgressIndicator(),),) : Scaffold(
      extendBody: true,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.black),
        ),
        child: CurvedNavigationBar(
          key: navigationBarKey,
          height: 60,
          backgroundColor: Colors.white,
          color: Color.fromRGBO(232, 241, 250, 1),
          buttonBackgroundColor: Color.fromRGBO(232, 241, 250, 1),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300,),
          items: iconList,
          onTap: (index){
            if(index == 0){
              getCustomerInformation(_user!.phoneNumber);
            }
            setState(() {
              currentIndexOfButton = index;
            });
          },
        ),
      ),
      appBar: currentIndexOfButton == 0 ?AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 12, top: 2, bottom: 3),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen(isMale: widget.isMale,),));
                },
                child: ClipOval(
                  child: Container(
                    height: 45,
                    width: 45,
                    child: customer.customer_profile_picture == "" ? Image.asset("assets/images/men.jpg", fit: BoxFit.cover,) : Image.network("https://192.168.125.103/hairsalon/assets/${customer.customer_profile_picture}", fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
          ],
        ),
        toolbarHeight: 70
        ,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SalonLikedScreen(isMale: widget.isMale,),));
            },
            child: Container(
              child: Center(child: Image.asset('assets/images/heart.png',height: 28, width: 28,)),
            ),
          ),
          SizedBox(width: 18,),
        ],
      ): null,
      body: currentIndexOfButton == 0 ?SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12, top: 12,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Hi, ${customer.customer_full_name}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),)
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 12, top: 8),
                child: GestureDetector(
                  onTap: () {
                    getLocationOfUser();
                    setState((){
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, size: 20,),
                      Text(address, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize:15),),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20,),
                child: Container(
                  height: 50,
                  width: 400,
                  child: TextField(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(isMale: widget.isMale,),));
                    },
                    decoration:InputDecoration(
                      iconColor: Colors.grey,
                      contentPadding: EdgeInsets.only(top: 8, bottom: 8,),
                      prefixIcon: Padding(padding: EdgeInsets.only(left: 10),child: Icon(Icons.search,)),
                      hintText: "Search by Salon, Service, ..",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("What do you want to do?", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                  ],
                ),
              ),

              Container(
                height: 113,
                margin: EdgeInsets.only(left: 0.001),
                child: widget.isMale == true ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalonsListScreen(isMale: widget.isMale,),));
                            },
                            child: Container(
                              height: 75,
                              margin: EdgeInsets.only(top: 10,),
                              width:75,
                              decoration: BoxDecoration(
                                // boxShadow: [
                                //   BoxShadow(color: Colors.grey.shade400, blurRadius: 10,spreadRadius: 0.2),
                                // ],
                                color: Color.fromRGBO(232, 241, 250, 1),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(child: Image.asset(maleServiceIconUrl[index], height: 28, width: 28,),),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 30,),
                              Text(maleServiceName[index], style: TextStyle(fontSize: 13),),
                            ],
                          )
                        ],
                      );
                    },
                ) :
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalonsListScreen(isMale: widget.isMale,),));
                            },
                            child: Container(
                              height: 75,
                              margin: EdgeInsets.only(top: 10,),
                              width:75,
                              decoration: BoxDecoration(
                                // boxShadow: [
                                //   BoxShadow(color: Colors.grey.shade400, blurRadius: 10,spreadRadius: 0.2),
                                // ],
                                color: Color.fromRGBO(232, 241, 250, 1),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(child: Image.asset(femaleServiceIconUrl[index], height: 28, width: 28,),),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 30,),
                              Text(femaleServiceName[index], style: TextStyle(fontSize: 13),),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),

              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12, top: 25, bottom: 18),
                    child: Text("Popular Salons", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                  ),
                ],
              ),


              CarouselSlider.builder(
                  itemCount: salonList.length,
                  itemBuilder: (context, index, realIndex){
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalonScreen(isMale: widget.isMale,),));
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
                                child: Image.network("https://192.168.125.103/hairsalon/assets/${salonList[index].salon_picture}", fit: BoxFit.cover,)),
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
                                      Text(salonList[index].salon_name.toString(), style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                      Text(salonList[index].salon_address.toString(), style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w600),),
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
                    setState((){topRatedActiveIndex = index;});
                  },
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  height: 250,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 8),
                child: AnimatedSmoothIndicator(
                  activeIndex: topRatedActiveIndex,
                  count: 5,
                  effect: WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.black12,
                    activeDotColor: Colors.blue,
                  ),
                ),
              ),


              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12, top: 25, bottom: 18),
                    child: Text("Recently Viewed", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                  ),
                ],
              ),


              CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (context, index, realIndex){
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalonScreen(isMale: widget.isMale,),));
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
                              child: Image.asset("assets/images/slaon4.png", fit: BoxFit.cover,)),
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
                    setState((){recentlyActiveIndex = index;});
                  },
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  height: 250,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 8),
                child: AnimatedSmoothIndicator(
                  activeIndex: recentlyActiveIndex,
                  count: 5,
                  effect: WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.black12,
                    activeDotColor: Colors.blue,
                  ),
                ),
              ),

              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12, top: 25, bottom: 18),
                    child: Text("Top Rated", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                  ),
                ],
              ),


              CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (context, index, realIndex){
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalonScreen(isMale: widget.isMale,),));
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
                    setState((){offersActiveIndex = index;});
                  },
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  height: 250,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: AnimatedSmoothIndicator(
                  activeIndex: offersActiveIndex,
                  count: 5,
                  effect: WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.black12,
                    activeDotColor: Colors.blue,
                  ),
                ),
              ),

              SizedBox(
                height: 80,
              ),

            ],
          ),
        ),
      ) : currentIndexOfButton == 1 ? SearchScreen(isMale: widget.isMale,) : currentIndexOfButton == 2? AppointmentScreen(isMale: widget.isMale,) : UserProfileScreen(isMale: widget.isMale,),
    );
  }

}