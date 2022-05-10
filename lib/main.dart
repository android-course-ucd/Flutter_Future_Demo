import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api.dart';
import 'package:flutter_application_1/food_truck.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const HomeScreen(title: "Hello World"),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      body: FutureBuilder(
        // Future Builder builds UI when Future returns data
        future: foodTruckList(), // API call is our Future
        builder: (context, AsyncSnapshot<List<FoodTruck>> snapshot) {
          // The type of data we expect to receive is a List<FoodTruck>
          if (snapshot.hasData) {
            // If data is received, generate list of Food Truck UI
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => FoodTruckItem(
                foodTruckData: snapshot.data![index],
              ),
            );
          }
          return const Center(
              child:
                  CupertinoActivityIndicator()); // Else return loading indicator
        },
      ),
    );
  }
}

class FoodTruckItem extends StatelessWidget {
  // Widget (View) for Food Truck Item
  final FoodTruck foodTruckData;

  const FoodTruckItem({Key? key, required this.foodTruckData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.network(
                      foodTruckData.imageUrl!)), // Get image from URL
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(foodTruckData.name!,
                    style: const TextStyle(
                        color: CupertinoColors.secondaryLabel, fontSize: 40)),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      foodTruckData.location!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    Text(foodTruckData.openTime!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
