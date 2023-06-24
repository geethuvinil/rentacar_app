import 'package:flutter/material.dart';

class PrevoiusFeedbackScreen extends StatefulWidget {
  const PrevoiusFeedbackScreen({super.key});

  @override
  State<PrevoiusFeedbackScreen> createState() => _PrevoiusFeedbackScreenState();
}

class _PrevoiusFeedbackScreenState extends State<PrevoiusFeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("View previous feedbacks"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              feedbackDetails(
                  name: "Yash",
                  date: "24/01/2023",
                  title: "Amazing service.",
                  subtitile:
                      "I took Ford Mustang for rent. Sooper service, Powerful car, reasonable amount. Happy !!"),
              feedbackDetails(
                  name: "Muhammed Ali Razaq",
                  date: "10/11/2022",
                  title: "Good.But not perfect",
                  subtitile: "Good. Need to improve more"),
              feedbackDetails(
                  name: "John Kurian Jose Maliyekkal",
                  date: "19/02/2021",
                  title: "My fav always",
                  subtitile:
                      " Their services, cars, maintenance, rent amount eveything is my always favorite."),
                      feedbackDetails(
                        name: "unknown",
                        date: "20/01/2020",
                        title: "good."
                      ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      )),
    );
  }

  feedbackDetails(
      {String? name, String? date, String? title, String? subtitile}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple.shade900),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    ''' ${name ?? ""} ''',
                textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Colors.blue.shade900,
                        ),
                  ),
                ),
                Text(date ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blue.shade900))
              ],
            ),
            ListTile(
              title: Text(title ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
              subtitle: Text(subtitile ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
