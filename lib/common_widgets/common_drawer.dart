import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rent_a_car/screens/favorites_screen.dart';
import 'package:rent_a_car/screens/payments_screen.dart';
import 'package:rent_a_car/screens/prevoius_feedback_screen.dart';
import 'package:rent_a_car/screens/reminder_screen.dart';
import 'package:rent_a_car/screens/rents_screen.dart';

import '../screens/contact_screen.dart';
import '../screens/my_account_screen.dart';

class CommonDrawer extends StatefulWidget {
  bool? isFromSellerSide;
   CommonDrawer({this.isFromSellerSide});

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(155, 218, 223, 0.9),
                ),
                child: Center(
                    child: Text(
                 widget.isFromSellerSide! ?
              "Hey Rental Service" : "Hey Geethu",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 21),
                )),
              ),
              widget.isFromSellerSide! ?
               drawerListTile(
                title: "Returned cars",
                iconName: Icons.download_done,
                onTapMove: () => FavoritesScreen(),
              ):
              drawerListTile(
                title: "Favorites",
                iconName: Icons.favorite_rounded,
                onTapMove: () => FavoritesScreen(),
              ),
              widget.isFromSellerSide! ?
               drawerListTile(
                title: "Feedbacks",
                iconName: Icons.feedback_rounded,
                 onTapMove: () => PrevoiusFeedbackScreen(),
              ):
              drawerListTile(
                title: "Reminders",
                iconName: Icons.notifications_active,
                 onTapMove: () => ReminderScreen(),
              ),
              drawerListTile(
                title: "Rents",
                iconName: Icons.car_rental_rounded,
                onTapMove: () => RentsScreen(),
              ),
              drawerListTile(
                title: "Payments",
                iconName: Icons.account_balance_rounded,
                  onTapMove: () => PaymentScreen(),
              ),
              drawerListTile(
                title: "Account",
                iconName: Icons.account_box_rounded,
                onTapMove: () => MyAccountScreen(isSellerAccount: widget.isFromSellerSide! ? true: false,),
              ),
              drawerListTile(
                  title: "Contact Us",
                  iconName: Icons.support_agent_rounded,
                  onTapMove: () => ContactScreen()),
              drawerListTile(
                  title: "Logout",
                  iconName: Icons.logout_rounded,
                  onTapMove: () => logoutDialog()),
            ],
          ),
        ),
      );
  }
  
  drawerListTile({String? title, IconData? iconName, Function()? onTapMove}) {
    return ListTile(
        title: Text(
          title!,
          style: TextStyle(fontSize: 17),
        ),
        leading: Icon(iconName),
        onTap: () {
         Get.back();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => onTapMove!()));
        });
  }
  Future<bool> logoutDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          height: 150,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Do you want to really exit from the app?",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                       Get.back();
                      },
                      child: Text("No")),
                  ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Text("Yes"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}