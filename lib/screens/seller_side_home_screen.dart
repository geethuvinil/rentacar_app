import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_a_car/common_widgets/available_cars.dart';
import 'package:rent_a_car/common_widgets/common_drawer.dart';
import 'package:rent_a_car/screens/my_account_screen.dart';
import 'package:rent_a_car/screens/rents_screen.dart';

class SellerSideHomeScreen extends StatefulWidget {
  const SellerSideHomeScreen({super.key});

  @override
  State<SellerSideHomeScreen> createState() => _SellerSideHomeScreenState();
}

class _SellerSideHomeScreenState extends State<SellerSideHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
       
          IconButton(
              onPressed: () {
                 Get.to(() => RentsScreen());
              },
              icon: Icon(Icons.car_rental, size: 32)),
          IconButton(
              onPressed: () {
            Get.to(() => MyAccountScreen(isSellerAccount: true,));
              },
              icon: Icon(Icons.person, size: 32))
        ],
      ),
      drawer: CommonDrawer(isFromSellerSide: true),
      body: SingleChildScrollView(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25,top: 20),
            child: Text("Welcome to car rental service",
            style: TextStyle(
              fontSize: 22,
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold          ),),
          ),
          Divider(),
          SizedBox(height: 30,),
          AvailableCars(),

        ],
      ),),
    );
  }
}