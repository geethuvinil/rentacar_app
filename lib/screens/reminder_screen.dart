import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Reminder"),
      ),
      body: SingleChildScrollView(child: Column(children: [
Lottie.network("https://assets9.lottiefiles.com/packages/lf20_gMlW30ngjC.json",height: 200,width: MediaQuery.of(context).size.width),
SizedBox(
  height: 30,
),
Text("xx days remaining to enjoy your car",
style: TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 19,
  color: Colors.deepPurple
),),
SizedBox(height: 10,),
reminderWidget(content: "Date of purchase : 22/01/2023"),
reminderWidget(content: "Duartion : 10 months "),
reminderWidget(content: "Date of return : 22/11/2023")
      ],),),
    );
  }
   reminderWidget({String? content}){
    return  Padding(
              padding: const EdgeInsets.only(left: 15,top: 5),
              child: Text(content!, style: TextStyle(
                fontSize: 18,
              ),),
            );
  }
}