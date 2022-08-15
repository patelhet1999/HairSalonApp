import 'package:flutter/material.dart';
import 'package:hair_salon_application/screens/cancel_appointment_details_screen.dart';

import '../models/customer.dart';

class CancelAppointmentsScreen extends StatefulWidget {
  bool isMale;

  CancelAppointmentsScreen({Key? key, required this.isMale,}) : super(key: key);

  @override
  State<CancelAppointmentsScreen> createState() => _CancelAppointmentsScreenState();
}

class _CancelAppointmentsScreenState extends State<CancelAppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CancelAppointmentDetailsScreen(isMale: widget.isMale, ),));
        },
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 15, right: 15,bottom: 12),
          height: 215,
          width: 365,
          decoration: BoxDecoration(
            color: Color.fromRGBO(232, 241, 250, 1),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Container(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Thu, Sep 17, 2022",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
                    Text("12:30",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hair Studio",style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),),
                          Text("4650 Greenvilla, Anand",style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Rs 100",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                          Text("30 min",style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Center(child: Text("Cancelled",style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),)),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}