import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Payments"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:110,top: 10,bottom: 10),
              child: Text(
                "CAR DETAILS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Divider(),
           carDetailsWidget(content: "Car Name: HONDA ACCORD"),
             carDetailsWidget(content: "Car Model: 2022"),
             carDetailsWidget(content: "Car Price: 4500 rupees per day"),
             carDetailsWidget(content: "Car Fuel: Petrol"),
            carDetailsWidget(content: "Car Color: HONDA ACCORD"),
             carDetailsWidget(content: "Name of the user: RAGHAV"),
             carDetailsWidget(content: "Date of purchase: 22/01/2023"),
             carDetailsWidget(content: "Duration:1 year"),
             carDetailsWidget(content: "Date of return: 22/01/2024"),
             SizedBox(
              height: 80,
             ),
             Center(child: ElevatedButton(onPressed: (){}, child: Text("Pay")))

          ],
        ),
      ),
    );
  }
  carDetailsWidget({String? content}){
    return  Padding(
              padding: const EdgeInsets.only(left: 15,top: 5),
              child: Text(content!, style: TextStyle(
                fontSize: 18,
              ),),
            );
  }
}
