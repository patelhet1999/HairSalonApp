import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_application/screens/userprofile_screen.dart';

import '../models/customer.dart';
import 'apponitment_screen.dart';

class SearchScreen extends StatefulWidget{

  bool isMale;

  SearchScreen({Key? key, required this.isMale,}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: TextField(
            autofocus: false,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset("assets/images/x.png", height: 0.01, width: 0.01,color: Colors.grey),
              ),
              prefixIcon: Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Icon(Icons.arrow_back, color: Colors.grey,size: 30)),
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.white,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.white,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.white,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.white,
                ),
              ),
              hintText: "Search",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        leadingWidth: 0,
      ),
    );
  }
}