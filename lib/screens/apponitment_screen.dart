import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_application/screens/active_appointments.dart';
import 'package:hair_salon_application/screens/cancel_appointments.dart';
import 'package:hair_salon_application/screens/completed_appointments.dart';
import 'package:hair_salon_application/screens/search_screen.dart';
import 'package:hair_salon_application/screens/userprofile_screen.dart';

import '../models/customer.dart';

class AppointmentScreen extends StatefulWidget {

  bool isMale;

  AppointmentScreen({Key? key, required this.isMale,}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Text(""),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("Appointments",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
          bottom: TabBar(
              tabs: [
              Tab(text: "Active"),
              Tab(text: "Completed",),
              Tab(text: "Cancelled",),
              ],
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: [
            ActiveAppointmentsScreen(isMale: widget.isMale,),
            CompletedAppointmentsScreen(isMale: widget.isMale,),
            CancelAppointmentsScreen(isMale: widget.isMale,),
          ],
        ),
      ),
    );
  }
}
