import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_a_car/screens/main_screen.dart';
import 'package:rent_a_car/screens/seller_side_home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(155, 218, 223, 0.9),
      body: Column(children: [
        SizedBox(
          height: 120,
        ),
        Center(
          child: Text("WELCOME",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),),
        
        ),
          SizedBox(height: 30,),
        Text("Are you a seller or a buyer?",
        style: TextStyle(
          fontSize: 23
        ),),
        SizedBox(
          height: 20,
        ),
      ElevatedButton(onPressed: (){
        Get.to(() => SellerSideHomeScreen());
      }, child: Text("I am a Seller")),
      SizedBox(
          height: 20,
        ),
      ElevatedButton(onPressed: (){
   Get.to(() => MainScreen());
      }, child: Text("I am a Buyer"))
      
      ],),
    );
  }
}