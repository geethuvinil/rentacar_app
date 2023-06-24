import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_a_car/screens/home_screen.dart';
import 'package:rent_a_car/screens/purchase_screen.dart';
import 'package:rent_a_car/screens/return_screen.dart';

class CarDetailsScreen extends StatefulWidget {
  String? carImage;
  String? carName;
  String? carModel;
  String? carFuel;
  String? carColor;
  String? carPrice;
  CarDetailsScreen(
      {this.carImage,
      this.carColor,
      this.carFuel,
      this.carModel,
      this.carName,
      this.carPrice});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("More details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            moreDetailsWidget(),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                 Get.to(() => PurchaseScreen(perdayAmount: widget.carPrice,));
                },
                child: Text("Purchase")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
               
                 Get.to(() => ReturncarScreen());
                },
                child: Text("Return")),
          ],
        ),
      ),
    );
  }

  moreDetailsWidget() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple)),
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: Image(
                image: AssetImage(widget.carImage ?? ""),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                "Name: ${widget.carName}" ?? "",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                "Model: ${widget.carModel}" ?? "",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                "Color: ${widget.carColor}" ?? "",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                "Fuel Type: ${widget.carFuel}" ?? "",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                "Price: ${widget.carPrice}" ?? "",
                style: TextStyle(color: Colors.red, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.verified_rounded,
                    color: Colors.blue.shade700,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "This car is available!!",
                    style: TextStyle(color: Colors.blue.shade700, fontSize: 17),
                  ),
                ],
              ),
            ),
// if car mot avaialable Icon(Icons.cancel_presentation_sharp)
// also write condition in buttons.
          ],
        ),
      ),
    );
  }

  dialogBox() {
    return AlertDialog(
      title: Text(
        "Sfsd",
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            child: Text("No")),
        ElevatedButton(
            onPressed: () {
              //SystemNavigator.pop();
            },
            child: Text("Yes"))
      ],
    );
  }
}
