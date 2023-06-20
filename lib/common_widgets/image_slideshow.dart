import 'package:flutter/material.dart';


class SlideShowCardWidget extends StatefulWidget {
  String? carImage;
  String? carName;
  String? carModel;
  String? carFuel;
  String? carColor;
  String? carPrice;
   SlideShowCardWidget({this.carName,this.carImage,this.carColor,this.carFuel,this.carModel,this.carPrice});


  @override
  State<SlideShowCardWidget> createState() => _SlideShowCardWidgetState();
}

class _SlideShowCardWidgetState extends State<SlideShowCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 10, bottom: 10),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image(
              image: AssetImage(widget.carImage!),
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Name: ${widget.carName!}",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Text("Model: ${widget.carModel!}"),
            Text("Fuel Type: ${widget.carFuel!}"),
            Text("Color: ${widget.carColor!}"),
            Text(
              "Price: ${widget.carPrice!}",
              style: TextStyle(color: Colors.red),
            ),
            TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => moreDetailsMove!(),
                  //     ));
                },
                child: Text("More details"))
          ],
        ),
      ),
    );
  }
 

}