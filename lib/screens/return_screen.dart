import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:rent_a_car/screens/home_screen.dart';


class ReturncarScreen extends StatefulWidget {
  const ReturncarScreen({super.key});

  @override
  State<ReturncarScreen> createState() => _ReturncarScreenState();
}

class _ReturncarScreenState extends State<ReturncarScreen> {
  TextEditingController _feebackController  = TextEditingController();
  double? ratingValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Return"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple.shade900),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    returnDetails(
                        value: "Estimated date of delivery : 22/01/2024"),
                    returnDetails(value: "Total rent amount: Rs.1 lakh"),
                    returnDetails(value: "Rent amount payed: Rs.50,000"),
                    returnDetails(value: "Balance amount: Rs.50,000"),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Please write a feedback on us",
              style: TextStyle(color: Colors.teal, fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _feebackController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "enter your feedback"),
              ),
            ),SizedBox(
              height: 20,
            ),
            TextButton(onPressed: (){
              _feebackController.clear();
            }, child: Text("Submit feedback")),
            SizedBox(
              height: 20,
            ),
            Text(
              "Rate Us",
              style: TextStyle(color: Colors.orange.shade900, fontSize: 22),
            ),
            RatingBar.builder(
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (rating) {
                  setState(() {
                    print(rating);
                    ratingValue = rating;
                    print("ahjgsagdasd$ratingValue");
                  });
                }),
            ratingValue == 1.0
                ? Text(
                    "We will improve more.",
                  )
                : ratingValue == 5.0
                    ? Text("Wow! Thank you for your feedback")
                    : Container(),
                    SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
           returnDialogBox();
            }, child: Text("Return"))
          ],
        ),
      ),
    );
  }

  returnDetails({String? value}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: Text(
        value!,
        style: TextStyle(fontSize: 17, color: Colors.black),
      ),
    );
  }


  returnDialogBox(){
    return Get.dialog(
       Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Material(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "Do you want to return this car?",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18
                    ),
                    textAlign: TextAlign.center,

                  ),
                  // const SizedBox(height: 15),
                  // const Text(
                  //   "Message Text",
                  //   textAlign: TextAlign.center,
                  // ),
                  const SizedBox(height: 20),
                  //Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: const Text(
                            'NO',
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0xFFFFFFFF), backgroundColor: Colors.deepPurple, minimumSize: const Size(0, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                           Get.off(() => HomeScreen());
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          child: const Text(
                            'YES',
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0xFFFFFFFF), backgroundColor: Colors.deepPurple, minimumSize: const Size(0, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Get.snackbar("Return request successfull", "Please return the car to the shop",
                            backgroundColor: Colors.deepPurple.shade300,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM);
                            Get.off(() => HomeScreen());
                        
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  ),
    );
  }
}
