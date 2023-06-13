import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:rent_a_car/screens/contact_screen.dart';
import 'package:rent_a_car/screens/my_account_screen.dart';
import 'package:rent_a_car/screens/rents_screen.dart';

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
          IconButton(onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RentsScreen(),
                    ));
          }, icon: Icon(Icons.car_rental, size: 32)),
          IconButton(onPressed: () {
          
          }, icon: Icon(Icons.search, size: 32)),
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
                title: "Rents",
                iconName: Icons.car_rental_rounded,
                onTapMove: () => RentsScreen(),
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
                onTapMove: () => ContactScreen()
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
          Image(image: AssetImage("assets/icons/enjoy_car.jpg"),height: 80,)
        ],
      ),
    );
  }

  favoritesTile() {
    return Column(
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
              slideShowDetails(
                imageName: "assets/car_images/honda_civic.jpg",
                name: "Honda Civic",
                model: "2018",
                fuelType: "Petrol",
                colorName: "Black",
                priceValue: "Rs.1100 per day",
              ),
              slideShowDetails(
                imageName: "assets/car_images/maruti_baleno.jpg",
                name: "Maruti Suzuki Baleno",
                model: "2020",
                fuelType: "Diesel",
                colorName: "Blue",
                priceValue: "Rs.1000 per day",
              ),
              slideShowDetails(
                imageName: "assets/car_images/nissan_patrol.jpg",
                name: "Nissan Patrol",
                model: "2022",
                fuelType: "Diesel",
                colorName: "Gold",
                priceValue: "Rs.1800 per day",
              ),
               slideShowDetails(
                imageName: "assets/car_images/ford_mustang.jpg",
                name: "Ford Mustang",
                model: "2022",
                fuelType: "Diesel",
                colorName: "Red",
                priceValue: "Rs.4500 per day",
              ),
            ])
      ],
    );
  }

availableTile(){
  return Column(
    children: [
      Text("Now Available",
       style: TextStyle(
            fontSize: 18,
          ),),
         ImageSlideshow(
             isLoop: true,
          autoPlayInterval: 2000,
            initialPage: 0,
            height: MediaQuery.of(context).size.height - 400,
          children: [
slideShowDetails(
                imageName: "assets/car_images/bmw_i7.jpg",
                name: "BMW series 7",
                model: "2022",
                fuelType: "Diesel",
                colorName: "Black",
                priceValue: "Rs.10000 per day",
              ),
              slideShowDetails(
                imageName: "assets/car_images/toyota_innova.jpg",
                name: "Toyota Innova",
                model: "2019",
                fuelType: "Petrol",
                colorName: "White",
                priceValue: "Rs.3000 per day",
              ),
              slideShowDetails(
                imageName: "assets/car_images/chevrolet_impala.jpg",
                name: "Chevrolet Impala",
                model: "2021",
                fuelType: "Diesel",
                colorName: "Black",
                priceValue: "Rs.8500 per day",
              ),
                slideShowDetails(
                imageName: "assets/car_images/hyundai_elentra.jpg",
                name: "Hyundai Elentra",
                model: "2020",
                fuelType: "Petrol",
                colorName: "Blue",
                priceValue: "Rs.4500 per day",
              ),
         ])
    ],
  );
}
  slideShowDetails(
      {String? imageName,
      String? name,
      String? model,
      String? colorName,
      String? fuelType,
      String? priceValue,
      Function()? moreDetailsMove}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 15,right: 10,bottom: 10),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image(
              image: AssetImage("$imageName"),
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Name: ${name!}",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Text("Model: ${model!}"),
            Text("Fuel Type: ${fuelType!}"),
            Text("Color: ${colorName!}"),
            Text(
              "Price: ${priceValue!}",
              style: TextStyle(color: Colors.red),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => moreDetailsMove!(),
                      ));
                },
                child: Text("More details"))
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
