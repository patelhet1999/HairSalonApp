import 'package:flutter/material.dart';
import 'package:hair_salon_application/models/customer.dart';
import 'package:hair_salon_application/screens/appointment_confirmed_screen.dart';
import 'package:hair_salon_application/screens/apponitment_screen.dart';
import 'package:hair_salon_application/screens/salon_screen.dart';

class BookAppointmentScreen extends StatefulWidget{
  bool isMale;
  bool isSalonLiked = true;
  BookAppointmentScreen({Key? key, required this.isMale, }) : super(key: key);

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {

  bool hairCutCheckBox = false;
  bool beardTrimCheckBox = false;
  bool facialCheckBox = false;
  bool hairColorCheckBox = false;
  bool hairTreatmentCheckBox = false;
  bool massageCheckBox = false;
  bool skinTreatmentCheckBox = false;
  bool isSalonLiked = true;
  int currentStep = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Book Appointment",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
        leading: GestureDetector( onTap: (){Navigator.of(context).pop();},child: Icon(Icons.arrow_back, color: Colors.black,size: 28)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 15,top: 15),
              child: SingleChildScrollView(
                child: Stepper(
                  physics: NeverScrollableScrollPhysics(),
                  controlsBuilder: (context,controlsDetails){
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 130,
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
                                final isLastStep = currentStep == 3;

                                if(isLastStep){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppointmentConfirmedScreen(isMale: widget.isMale,),));
                                }
                                else{
                                  setState((){
                                    currentStep = currentStep + 1;
                                  });
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Continue")
                                ],
                              ),
                            ),
                          ),

                          Container(
                            height: 40,
                            width: 130,
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
                                if(currentStep == 0){
                                  Navigator.of(context).pop();
                                }
                                else{
                                  setState((){
                                    currentStep = currentStep - 1;
                                  });
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Back")
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                  currentStep: currentStep,
                  onStepContinue: (){
                    final isLastStep = currentStep == 3;

                    if(isLastStep){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppointmentScreen(isMale: widget.isMale,),));
                    }
                    else{
                      setState((){
                        currentStep = currentStep + 1;
                      });
                    }
                  },
                  onStepCancel: (){
                    if(currentStep == 0){
                      Navigator.of(context).pop();
                    }
                    else{
                      setState((){
                        currentStep = currentStep - 1;
                      });
                    }
                  },
                  onStepTapped: (index){
                    setState((){
                      currentStep = index;
                    });
                  },
                  steps: [
                    Step(
                      title: Text("Select Services"),
                        isActive: currentStep >= 0,
                        state: currentStep > 0 ? StepState.complete : StepState.indexed,
                        content:SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: hairCutCheckBox,
                                          onChanged: (newValue){
                                            setState((){
                                              hairCutCheckBox = newValue!;
                                            });
                                          },
                                      ),
                                      Text("Hair Cut", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Text("Rs 100", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                      Text("30 min", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),
                                ],
                              ),

                              Divider(color: Colors.black,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: beardTrimCheckBox,
                                        onChanged: (newValue){
                                          setState((){
                                            beardTrimCheckBox = newValue!;
                                          });
                                        },
                                      ),
                                      Text("Beard Trim", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Text("Rs 100", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                      Text("30 min", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),
                                ],
                              ),

                              Divider(color: Colors.black,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: facialCheckBox,
                                        onChanged: (newValue){
                                          setState((){
                                            facialCheckBox = newValue!;
                                          });
                                        },
                                      ),
                                      Text("Facial", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Text("Rs 100", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                      Text("30 min", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),
                                ],
                              ),

                              Divider(color: Colors.black,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: hairColorCheckBox,
                                        onChanged: (newValue){
                                          setState((){
                                            hairColorCheckBox = newValue!;
                                          });
                                        },
                                      ),
                                      Text("Hair Color", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Text("Rs 100", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                      Text("30 min", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),
                                ],
                              ),

                              Divider(color: Colors.black,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: hairTreatmentCheckBox,
                                        onChanged: (newValue){
                                          setState((){
                                            hairTreatmentCheckBox = newValue!;
                                          });
                                        },
                                      ),
                                      Text("Hair Treatment", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Text("Rs 100", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                      Text("30 min", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),
                                ],
                              ),

                              Divider(color: Colors.black,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: massageCheckBox,
                                        onChanged: (newValue){
                                          setState((){
                                            massageCheckBox = newValue!;
                                          });
                                        },
                                      ),
                                      Text("Massage", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Text("Rs 100", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                      Text("30 min", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),
                                ],
                              ),

                              Divider(color: Colors.black,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: skinTreatmentCheckBox,
                                        onChanged: (newValue){
                                          setState((){
                                            skinTreatmentCheckBox = newValue!;
                                          });
                                        },
                                      ),
                                      Text("Skin Treatment", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Text("Rs 100", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                      Text("30 min", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),),
                                    ],
                                  ),
                                ],
                              ),

                              Divider(color: Colors.black,),
                            ],
                          ),
                        ),
                    ),
                    Step(
                      state: currentStep > 1 ? StepState.complete : StepState.indexed,
                      isActive: currentStep >= 1,
                      title: Text("Select Staff"),
                      content:SingleChildScrollView(
                        child: Container(
                          height: 140,
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
                                    ),
                                  ),

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
                      ),
                    ),
                    Step(
                      state: currentStep > 2 ? StepState.complete : StepState.indexed,
                      isActive: currentStep >= 2,
                      title: Text("Appointment",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                      content:SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin:EdgeInsets.only(bottom: 8,left: 10),
                                  child: Text("Date", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                ),
                              ],
                            ),
                            Container(
                              height: 95,
                              child: ListView.builder(
                                itemCount: 6,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index){
                                  return Container(
                                    margin: EdgeInsets.only(left: 10),
                                    height: 85,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(232, 241, 250, 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10),
                                    ),
                                  ),
                                    child: Container(
                                      margin: EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("Sun", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("17", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("April", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                 );
                                },
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin:EdgeInsets.only(bottom: 8,left: 10,top: 15),
                                  child: Text("Time", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                ),
                              ],
                            ),

                            Container(
                              height: 95,
                              child: ListView.builder(
                                itemCount: 6,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index){
                                  return Container(
                                    margin: EdgeInsets.only(left: 10),
                                    height: 85,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(232, 241, 250, 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10),
                                      ),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.all(15),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("8:00", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Step(
                      state: currentStep > 1 ? StepState.complete : StepState.indexed,
                      isActive: currentStep >= 3,
                      title: Text("Confirmation"),
                      content:SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                            onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SalonScreen(isMale: widget.isMale),));
                             },
                            child: Container(
                              height: 100,
                              width: 400,
                              margin: EdgeInsets.symmetric(vertical: 10,),
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
                                ],
                              ),
                            ),
                          ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin:EdgeInsets.only(bottom: 8,top: 15),
                                  child: Text("Appointment", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("April 17, 2022 8:00", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("From 8:00 to 9:00", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),),
                                  ],
                                ),
                              ],
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin:EdgeInsets.only(top: 30),
                                  child: Text("Services", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                ),
                              ],
                            ),

                            Divider(color: Colors.black,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50,
                                  width: 250,
                                  margin: EdgeInsets.only(bottom: 5,),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text("Hair Cut", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                            ],
                                          ),
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

                            Divider(color: Colors.black,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50,
                                  width: 250,
                                  margin: EdgeInsets.only(bottom: 5,),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text("Beard Trim", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                                            ],
                                          ),
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

                            Divider(color: Colors.black,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin:EdgeInsets.only(top: 23),
                                  child: Text("Payments", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                ),
                              ],
                            ),


                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:60,
                                      width: 280,
                                      child: ListView(
                                        physics: NeverScrollableScrollPhysics(),
                                        children: [
                                          RadioListTile(
                                              value: 1,
                                              groupValue: 1,
                                              onChanged: (value){

                                              },
                                            title: Text("Pay with Card"),
                                          )
                                        ],
                                      )),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        height:60,
                                        width: 280,
                                        child: ListView(
                                          physics: NeverScrollableScrollPhysics(),
                                          children: [
                                            RadioListTile(
                                              value: 2,
                                              groupValue: 1,
                                              onChanged: (value){

                                              },
                                              title: Text("Pay in Store"),
                                            )
                                          ],
                                        )),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}