import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:rent_a_car/common_widgets/image_slideshow.dart';
import 'package:rent_a_car/screens/car_details_screen.dart';
import 'package:rent_a_car/screens/contact_screen.dart';
import 'package:rent_a_car/screens/favorites_screen.dart';
import 'package:rent_a_car/screens/my_account_screen.dart';
import 'package:rent_a_car/screens/payments_screen.dart';
import 'package:rent_a_car/screens/reminder_screen.dart';
import 'package:rent_a_car/screens/rents_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        searchHintText: "Search",
        backgroundColor: Colors.white,
        title: Text(""),
        onSearch: (value) {
          setState(() {
            searchValue = value;
          });
          //  if(searchValue.contains("Honda Civic")){
          //    Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => RentsScreen(),
          //               ));
          //  }
          //  else{
          //    Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => ContactScreen(),
          //               ));
          //  }
        },
        actions: [
          IconButton(
              onPressed: () {
              
                     Get.to(() => FavoritesScreen());
              },
              icon: Icon(
                Icons.favorite,
                size: 32,
              )),
          IconButton(
              onPressed: () {
                 Get.to(() => RentsScreen());
              },
              icon: Icon(Icons.car_rental, size: 32)),
          IconButton(
              onPressed: () {
            Get.to(() => MyAccountScreen());
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
                onTapMove: () => FavoritesScreen(),
              ),
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
                onTapMove: () => MyAccountScreen(),
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
      ),
      body: WillPopScope(
        onWillPop: logoutDialog,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              reminderTile(),
              SizedBox(
                height: 10,
              ),
              favoritesTile(),
              SizedBox(
                height: 10,
              ),
              availableTile(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  reminderTile() {
    return InkWell(
      onTap: (){
        Get.to(() => ReminderScreen());
      },
      child: Container(
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
            Image(
              image: AssetImage("assets/icons/enjoy_car.jpg"),
              height: 80,
            )
          ],
        ),
      ),
    );
  }

  favoritesTile() {
    return InkWell(
      onTap: () {
      Get.to(() => FavoritesScreen());
      },
      child: Column(
        children: [
          Text(
            "My Favorites",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          ImageSlideshow(
              isLoop: true,
              autoPlayInterval: 2000,
              initialPage: 0,
              height: MediaQuery.of(context).size.height - 400,
              children: [
                SlideShowCardWidget(
                  carImage: "assets/car_images/honda_civic.jpg",
                  carName: "Honda Civic",
                  carModel: "2018",
                  carFuel: "Petrol",
                  carColor: "Black",
                  carPrice: "Rs.1100 per day",
                ),
                SlideShowCardWidget(
                  carImage: "assets/car_images/maruti_baleno.jpg",
                  carName: "Maruti Suzuki Baleno",
                  carModel: "2020",
                  carFuel: "Diesel",
                  carColor: "Blue",
                  carPrice: "Rs.1000 per day",
                ),
                SlideShowCardWidget(
                  carImage: "assets/car_images/nissan_patrol.jpg",
                  carName: "Nissan Patrol",
                  carModel: "2022",
                  carFuel: "Diesel",
                  carColor: "Gold",
                  carPrice: "Rs.1800 per day",
                ),
                SlideShowCardWidget(
                  carImage: "assets/car_images/ford_mustang.jpg",
                  carName: "Ford Mustang",
                  carModel: "2022",
                  carFuel: "Diesel",
                  carColor: "Red",
                  carPrice: "Rs.4500 per day",
                )
              ])
        ],
      ),
    );
  }

  availableTile() {
    return Column(
      children: [
        Text(
          "Now Available",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        ImageSlideshow(
            isLoop: true,
            autoPlayInterval: 2000,
            initialPage: 0,
            height: MediaQuery.of(context).size.height - 400,
            children: [
              SlideShowCardWidget(
                carImage: "assets/car_images/bmw_i7.jpg",
                carName: "BMW series 7",
                carModel: "2022",
                carFuel: "Diesel",
                carColor: "Black",
                carPrice: "Rs.10000 per day",
              ),
              SlideShowCardWidget(
                carImage: "assets/car_images/toyota_innova.jpg",
                carName: "Toyota Innova",
                carModel: "2019",
                carFuel: "Petrol",
                carColor: "White",
                carPrice: "Rs.3000 per day",
              ),
              SlideShowCardWidget(
                carImage: "assets/car_images/chevrolet_impala.jpg",
                carName: "Chevrolet Impala",
                carModel: "2021",
                carFuel: "Diesel",
                carColor: "Black",
                carPrice: "Rs.8500 per day",
              ),
              SlideShowCardWidget(
                carImage: "assets/car_images/hyundai_elentra.jpg",
                carName: "Hyundai Elentra",
                carModel: "2020",
                carFuel: "Petrol",
                carColor: "Blue",
                carPrice: "Rs.4500 per day",
              )
            ])
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
