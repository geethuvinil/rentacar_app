import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_a_car/screens/home_screen.dart';

class CommonDialogBox extends StatefulWidget {
  String? title;

   CommonDialogBox({this.title});

  @override
  State<CommonDialogBox> createState() => _CommonDialogBoxState();
}

class _CommonDialogBoxState extends State<CommonDialogBox> {
  @override
  Widget build(BuildContext context) {
    return  Dialog(
        child: Container(
          height: 150,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(15),
              child: Text(widget.title ?? "",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>HomeScreen()
                      ));
                         
                        },
                        child: Text("No")),
                    ElevatedButton(
                        onPressed: () {
                         
                          //SystemNavigator.pop();
                        },
                        child: Text("Yes"))
                  ],
                )
            ],
          ),
        ),
      );
  }
}