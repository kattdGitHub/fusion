import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Restaurant/restaurant.dart';
import 'package:fusion/Savebth/Add_Guest.dart';
import 'package:fusion/Savebth/Delete.dart';
import 'package:fusion/Savebth/Details.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:fusion/dashboard/Dashboard.dart';
import 'package:fusion/screens/home/restaurant_home_page.dart';
import 'package:fusion/utils/navigator.dart';

class RestaurantMadlyan extends StatelessWidget {
  const RestaurantMadlyan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Row(
          children: [
            const Text(
              'Restaurant Madlyan',
              style: TextStyle(
                color: Color(0xFF181715),
                fontSize: 20,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                _openBottomSheet(context);
              },
              child: Icon(Icons.more_horiz),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: const Image(
                          image: AssetImage("assets/image/Rectangle555.png")),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Restaurant Madlyan",
                style: TextStyle(
                  fontFamily: "Jost",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                  height: 26 / 18,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: AppConfig.width,
                child: const SafeArea(
                  child: Row(
                    children: [
                      Text(
                        "Restaurant Madlyan is a cozy, family-owned restaurant \n"
                        "located in the heart of downtown. Our menu features \nclassic"
                        "Italian comfort food, made with fresh, locally-\nsourced"
                        "ingredients. From our pasta and crispybacon to \nour "
                        "juicy...... ",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff777777),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Time: 11:00 AM to 11:00 PM",
                style: TextStyle(),
                textAlign: TextAlign.left,
              ),
            ), Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                child: Text(
                  " Details",
                  style: TextStyle(
                    fontFamily: "Jost",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                    height: 26 / 18,
                  ),
                  textAlign: TextAlign.left,
                ),onTap: () {
                  pushTo(context, Details());
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text(
                      "4211 Cherry Manhattan, New York",
                      style: TextStyle(
                        fontFamily: "Jost",
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff777777),
                        height: 17 / 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Icon(Icons.phone_android_outlined),
                    Text(
                      "+11 70 222 11 33",
                      style: TextStyle(
                        fontFamily: "Jost",
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff777777),
                        height: 17 / 12,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 10,
                        child: const Image(
                          image: AssetImage("assets/icons/ps.png"),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "www.madlyan.com",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff777777),
                          height: 17 / 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 272,
            width: AppConfig.width ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: AppConfig.width * 0.3,
                    height: 2,
                    color: Colors.black),
                TextButton(
                  child: Text(
                    "Add Guest Details",
                    style: const TextStyle(
                      fontFamily: "Jost",
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1e1d1d),
                      height: 15 / 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    pushTo(context, Add_Guest());
                  },
                ),
                Text(
                  "Add Terms and Condition",
                  style: const TextStyle(
                    fontFamily: "Jost",
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1e1d1d),
                    height: 15 / 22,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  child: Text(
                    "Edit",
                    style: const TextStyle(
                      fontFamily: "Jost",
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1e1d1d),
                      height: 15 / 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    pushTo(context, Restaurant());
                  },
                ),
                const Delete(),
              ],
            ),
          ),
        );
      },
    );
  }
}
