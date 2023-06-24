import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:rent_a_car/screens/car_details_screen.dart';

class RentsScreen extends StatefulWidget {
  const RentsScreen({super.key});

  @override
  State<RentsScreen> createState() => _RentsScreenState();
}

class _RentsScreenState extends State<RentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Rent Details"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Currently using",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
            ),
          ),
          ImageSlideshow(
              isLoop: true,
              autoPlayInterval: 2000,
              initialPage: 0,
              height: MediaQuery.of(context).size.height - 350,
              children: [
                slideShowDetails(
                  imageName: "assets/car_images/honda_civic.jpg",
                  name: "Honda Civic",
                  model: "2018",
                  fuelType: "Petrol",
                  colorName: "Black",
                  priceValue: "Rs.1100 per day",
                  purchasedOn: "12/05/2023"
                ),
              ]),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Previously used",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
            ),
          ),
          ImageSlideshow(
              isLoop: true,
              autoPlayInterval: 2000,
              initialPage: 0,
              height: MediaQuery.of(context).size.height - 350,
              children: [
                slideShowDetails(
                  imageName: "assets/car_images/bmw_i7.jpg",
                  name: "BMW series 7",
                  model: "2022",
                  fuelType: "Diesel",
                  colorName: "Black",
                  priceValue: "Rs.10000 per day",
                  purchasedOn: "22/10/2021",
                  deliveredOn: "23/01/2022",
                  
                ),
                slideShowDetails(
                  imageName: "assets/car_images/toyota_innova.jpg",
                  name: "Toyota Innova",
                  model: "2019",
                  fuelType: "Petrol",
                  colorName: "White",
                  priceValue: "Rs.3000 per day",
                  purchasedOn: "02/08/2017",
                  deliveredOn: "08/12/2017"
                ),

                slideShowDetails(
                  imageName: "assets/car_images/ford_mustang.jpg",
                  name: "Ford Mustang",
                  model: "2022",
                  fuelType: "Diesel",
                  colorName: "Red",
                  priceValue: "Rs.4500 per day",
                  purchasedOn: "16/05/2022",
                  deliveredOn: "20/11/2022"
                ),
              ])
        ]),
      ),
    );
  }

  slideShowDetails(
      {String? imageName,
      String? name,
      String? model,
      String? colorName,
      String? fuelType,
      String? priceValue,
     
      String? purchasedOn,
      String? deliveredOn}) {
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
            Text("Purchased on : ${purchasedOn ?? ""}" ),
            Text("Delivered on : ${deliveredOn ?? "currently using"}"),
            Text(
              "Price: ${priceValue!}",
              style: TextStyle(color: Colors.red),
            ),
            TextButton(
                onPressed: () {
                      Get.to(() => CarDetailsScreen(
                        carImage: imageName ?? "",
                        carName: name ?? "",
                        carModel: model ?? "",
                        carColor: colorName ??"",
                        carPrice: priceValue ?? "",
                        carFuel: fuelType ?? "",
                      ));
                },
                child: Text("More details"))
          ],
        ),
      ),
    );
  }
}
