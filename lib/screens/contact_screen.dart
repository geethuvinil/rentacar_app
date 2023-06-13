import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Contact us through any of the following methods.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: [
                gridCard(
                    data: "0091 9999999999",
                    iconName: Icons.call,
                    colorName: Colors.pink.shade300),
                gridCard(
                    data: "abvcdefgh\n@gmail.com",
                    iconName: Icons.email,
                    colorName: Colors.teal),
                     gridCard(
                    data: "xyz Street\nkochi\nKerala",
                    iconName: Icons.location_on,
                    colorName: Colors.green.shade700),
                     gridCard(
                    data: "FAQ",
                    iconName: Icons.help,
                    colorName: Colors.orangeAccent.shade400),
                     gridCard(
                    data: "Terms&\nConditions",
                    iconName: Icons.menu_book_rounded,
                    colorName: Colors.red.shade600),
                     gridCard(
                    data: "Privacy policy",
                    iconName: Icons.privacy_tip_rounded,
                    colorName: Colors.blue),
              ],
            )
          ],
        ),
      ),
    );
  }

  gridCard({String? data, IconData? iconName, Color? colorName}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: colorName,
        elevation: 4,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Icon(
              iconName!,
              size: 32,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                data!,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 17),
                textAlign: TextAlign.center,
                      
                       maxLines: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
