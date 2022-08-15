import 'package:flutter/material.dart';
import 'package:hair_salon_application/screens/introduction_screen.dart';


class OnBoardingScreen extends StatefulWidget{
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() {
    return OnBoardingScreenState();
  }
}

class OnBoardingScreenState extends State<OnBoardingScreen>{

  late PageController _pageController;

  late int currentIndex;

  List imageList = [
    "assets/images/onboard_1.png",
    "assets/images/onboard_2.png",
    "assets/images/onboard_3.png",
  ];

  List mainContentList = [
    "Pick A Service",
    "Find Your Nearest Salon",
    "Schedule Your Appointment",
  ];

  List subContentList = [
    "Book your beauty services on to go.\nChoose the best salon and services \nlike make-up, nails, spa & others.",
    "Set your location and find the nearest \nsalon to pamper you and get \noffers and discounts.",
    "You can schedule an appointment on\n your choice of time.Also you can \ncancel your appointment.",
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    currentIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 488,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 3,
                  onPageChanged: (index){
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context,index){
                    return Container(
                      height: 480,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(imageList[index],fit: BoxFit.fitWidth,),
                    );
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      margin: EdgeInsets.only(right: 5,),
                      child: ElevatedButton(
                        onPressed: (){

                        },
                        style: ButtonStyle(
                          backgroundColor: currentIndex == 0 ? MaterialStateProperty.resolveWith((states) => Colors.blue) : MaterialStateProperty.resolveWith((states) => Colors.grey),
                        ),
                        child: Text(""),
                      ),
                    ),

                    Container(
                      height: 8,
                      width: 8,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: currentIndex == 1 ? MaterialStateProperty.resolveWith((states) => Colors.blue) : MaterialStateProperty.resolveWith((states) => Colors.grey),
                        ),
                        onPressed: (){

                        },
                        child: Text(""),
                      ),
                    ),

                    Container(
                      height: 8,
                      width: 8,
                      margin: EdgeInsets.only(left: 5,),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: currentIndex == 2 ? MaterialStateProperty.resolveWith((states) => Colors.blue) : MaterialStateProperty.resolveWith((states) => Colors.grey),
                        ),
                        onPressed: (){

                        },
                        child: Text(""),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(mainContentList[currentIndex],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),textAlign: TextAlign.center,),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20,),
                child: Column(
                  children: [
                    Container(
                      child: Text(subContentList[currentIndex],style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w500, fontSize: 16,),textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 90,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => IntroductionScreen(),),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 33),
                      child: Text("Skip",style: TextStyle(color: Colors.grey.shade600,fontSize: 16),textAlign: TextAlign.center,),
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(right: currentIndex <= 1? 220: 150)),

                  Container(
                    child: currentIndex <= 1 ? Text("Next",style: TextStyle(color: Colors.grey.shade600,fontSize: 16),textAlign: TextAlign.center,) : Text(""),
                  ),


                  Container(
                    height: currentIndex <= 1? 40 : 40,
                    width: currentIndex <= 1? 40 : 150,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        gradient:  LinearGradient(
                          colors: [
                            Colors.deepPurple,
                            Color.fromARGB(255, 62, 182, 226)
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.blue
                    ),
                    child: currentIndex <= 1 ? Center(
                      child: IconButton(
                        onPressed: (){
                          if(currentIndex < 2) {
                            _pageController.nextPage(duration: Duration(milliseconds: 300,), curve: Curves.ease);
                          }
                        },
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                      ),
                    )
                    :
                      ElevatedButton(
                        style: ButtonStyle(
                          shadowColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.transparent) ,
                        ),
                        onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => IntroductionScreen(),),
                          );
                        },
                          child: Text("Get Started"),
                      ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}