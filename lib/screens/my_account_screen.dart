import 'package:flutter/material.dart';

class MyAccountScreen extends StatefulWidget {
  bool? isSellerAccount;
   MyAccountScreen({this.isSellerAccount});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           elevation: 2,
        title: Text("Account"),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              
              accountDetailsTile(
                  title: "Name",
                  subTitle: widget.isSellerAccount! ? "Rental Services": "Geethu Ajay",
                  iconName: Icons.person_outline_sharp),
                  Divider(),
        accountDetailsTile(
                  title: "Phone Number",
                  subTitle:  widget.isSellerAccount! ? "0091 9902730180": "0091 9947720297",
                  iconName: Icons.call),
                   Divider(),
        accountDetailsTile(
                  title: "Email Id",
                  subTitle:  widget.isSellerAccount! ? "rentalservice12@gmail.com": "geethuajay@gmail.com",
                  iconName: Icons.email_sharp),
                   Divider(),
        accountDetailsTile(
                  title: "Address",
                  subTitle:  widget.isSellerAccount! ? "Rental Services\nVypin,Kochi": "Skyline apartment\n Ernakulam",
                  iconName: Icons.location_on_sharp),
                   Divider(),
        accountDetailsTile(
                  title: "Password",
                  subTitle:  widget.isSellerAccount! ? "RentalSerice##12": "aabbcc",
                  iconName: Icons.password_sharp),
                   Divider(),
            ],
          ),
      ),
    );
  }

  accountDetailsTile({String? title, String? subTitle, IconData? iconName}) {
    return ListTile(
      title: Text(title!),
      subtitle: Text(subTitle!),
      leading: Icon(iconName),
    );
  }
}
