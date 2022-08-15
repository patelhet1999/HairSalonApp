import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hair_salon_application/screens/men_women_selection_screen.dart';
import 'package:hair_salon_application/screens/user_details_screen.dart';
import 'package:hair_salon_application/screens/userprofile_screen.dart';
import 'package:hair_salon_application/server_handler.dart';
import 'package:pinput/pinput.dart';
import 'home_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:google_fonts/google_fonts.dart';

enum MobileVerificationState{
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId = '';

  bool showLoading = false;

  final otpController = TextEditingController();
  final focusNode = FocusNode();
  late String phoneNumber;



  @override
  void dispose() {
    otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final defaultPinTheme = PinTheme(
    width: 38,
    height: 38,
    textStyle: GoogleFonts.poppins(
        fontSize: 20, color: Colors.deepPurple.shade900),
    decoration: BoxDecoration(
      color: Colors.blueGrey.shade50,
      borderRadius: BorderRadius.circular(24),
    ),
  );


  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential, String phoneNumber) async{

    setState(() {
      showLoading = true;
    });

    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      ServerHandler().checkPhoneNumberUniqueOrNot(phoneNumber).then((value){
        if(value){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsScreen(customerPhoneNumber: phoneNumber),));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => MenWomenSelectionScreen(),));
        }
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
    }
  }




  getMobileFormWidget(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    color: Colors.white,
                    height: 800,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/images/phone_number.png",fit: BoxFit.fill,),
                  ),

                  Positioned(
                    top: 130,
                    left: 128,
                    child: Container(
                      height: 30,
                      width: 400,
                      child: Text("Verify your", style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.w900, fontSize: 26,),),
                    ),
                  ),

                  Positioned(
                    top: 163,
                    left: 110,
                    child: Container(
                      height: 30,
                      width: 400,
                      child: Text("Phone number", style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.w900, fontSize: 26,),),
                    ),
                  ),

                  Positioned(
                    top: 330,
                    left: 75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("We will send you an ",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w500)),
                            Text("One Time Password",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
                          ],
                        ),
                        Text("on this mobile number",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 400,
                    left: 50,
                    child: Container(
                      height: 50,
                      width: 300,
                      padding: EdgeInsets.only(left: 15, right: 15,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffeeeeee),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black.withOpacity(0.13)),
                      ),
                      child: Form(
                        child: IntlPhoneField(
                          controller: phoneController,
                          disableLengthCheck: true,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15),
                            border: InputBorder.none,
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          cursorWidth: 2,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 480,
                    left: 95,
                    child: Container(
                      height: 40,
                      width: 200,
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
                        onPressed: () async{

                          setState(() {
                            showLoading = true;
                          });
                          await _auth.verifyPhoneNumber(
                              phoneNumber: phoneController.text,
                              verificationCompleted: (phoneAuthCredential) async{
                                setState(() {
                                  showLoading = false;
                                });
                                //signInWithPhoneAuthCredential(phoneAuthCredential);
                              },
                              verificationFailed: (verificationFailed) async{

                                setState(() {
                                  showLoading = false;
                                });
                              },
                              codeSent: (verificationId, resendingToken) async{
                                setState(() {
                                  showLoading = false;
                                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                                  this.verificationId = verificationId;
                                });
                              },
                              codeAutoRetrievalTimeout: (verificationId) async{

                              }
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Get Otp"),
                          ],
                        ),
                      ),
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

  getOtpFormWidget(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Stack(
                      children:[
                        Container(
                          color: Colors.white,
                          height: 820,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset("assets/images/otp.png",fit: BoxFit.cover,),
                        ),

                        Positioned(
                          top: 150,
                          left: 100,
                          child: Container(
                            height: 30,
                            width: 400,
                            child: Text("OTP Verification", style: TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.w900, fontSize: 26,),),
                          ),
                        ),

                        Positioned(
                          top: 312,
                          left: 130,
                          child: Text("Enter your OTP here ",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w500),),
                        ),

                        Positioned(
                          top: 340,
                          left: 47,
                          child: Container(
                            height: 80,
                            width: 290,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Pinput(
                              length: 6,
                              controller: otpController,
                              focusNode: focusNode,
                              defaultPinTheme: defaultPinTheme,
                              separator: SizedBox(width: 8),
                              focusedPinTheme: defaultPinTheme.copyWith(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.05999999865889549),
                                      offset: Offset(0, 3),
                                      blurRadius: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 425,
                          left: 93,
                          child: Container(
                            height: 40,
                            width: 200,
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
                              onPressed: () async{
                                PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpController.text);
                                signInWithPhoneAuthCredential(phoneAuthCredential,phoneController.text);
                                print(phoneNumber);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Verify")
                                ],
                              ),
                            ),
                          ),
                        ),

                      ]
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: showLoading ? Center(child: CircularProgressIndicator(),) : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE ?
      getMobileFormWidget(context) :
      getOtpFormWidget(context),
    );
  }
}