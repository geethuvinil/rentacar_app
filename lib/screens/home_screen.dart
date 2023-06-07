import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:rent_a_car/screens/my_account_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                size: 32,
              )),
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 32)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyAccountScreen(),
                    ));
              },
              icon: Icon(Icons.person, size: 32))
        ],
      ),
      drawer: Padding(
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
                  "Hey Geethuu",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 21),
                )),
              ),
              drawerListTile(
                title: "Favorites",
                iconName: Icons.favorite_rounded,
              ),
              drawerListTile(
                title: "Reminders",
                iconName: Icons.notifications_active,
              ),
              drawerListTile(
                title: "Payments",
                iconName: Icons.account_balance_rounded,
              ),
              drawerListTile(
                title: "Account",
                iconName: Icons.account_box_rounded,
                onTapMove: () => MyAccountScreen(),
              ),
              drawerListTile(
                title: "Contact Us",
                iconName: Icons.support_agent_rounded,
              ),
              drawerListTile(
                  title: "Logout",
                  iconName: Icons.logout_rounded,
                  onTapMove: () => logoutDialog()),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            reminderTile(),
            favoritesTile(),
            ],
        ),
      ),
    );
  }

  reminderTile() {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, style: BorderStyle.solid)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8),
            child: CircleAvatar(
              radius: 35,
              child: Text(
                "31",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Text(
            "days remaining\nto enjoy your car",
            style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
          ),
          Icon(
            Icons.car_rental_rounded,
            color: Colors.deepPurple,
            size: 40,
          )
        ],
      ),
    );
  }
favoritesTile(){
  return Column(
    children: [
      Text("My Favorites"),

    ],
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
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => onTapMove!()));
        });
  }

  logoutDialog() {
    return Dialog(
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
                      Navigator.pop(context);
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
    );
  }
}
