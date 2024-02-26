import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion/Restaurant/restaurant.dart';
import 'package:fusion/dashboard/Dashboard.dart';
import 'package:fusion/screens/home/restaurant_home_page.dart';
import 'package:fusion/utils/navigator.dart';

final list = [
  "Brazil",
  "Italia (Disabled)",
  "Tunisia" "Brazil",
  "Italia (Disabled)",
  "Tunisia",
  'Canada'
];

class ChooseRestaurant extends StatefulWidget {
  const ChooseRestaurant({super.key});

  @override
  State<ChooseRestaurant> createState() => _ChooseRestaurantState();
}

class _ChooseRestaurantState extends State<ChooseRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Text(
            "Choose a Restaurant",
            style: const TextStyle(
              fontFamily: "Jost",
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
              height: 35 / 24,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
            ),
            title: Text(
              list[index],
              style: TextStyle(
                fontFamily: "Jost",
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                height: 35 / 24,
              ),
            ),
            trailing: CircleAvatar(
              child: Icon(
                CupertinoIcons.delete,
                color: Colors.red,
              ),
            ),
            onTap: () {
              pushTo(context, Dashboard());
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushTo(context, AddRestaurant());
        },
        child: Icon(
          CupertinoIcons.add,
          size: 25.sp,
        ),
      ),
    );
  }
}
