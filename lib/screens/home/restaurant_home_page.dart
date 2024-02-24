import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:fusion/icons/switch.dart';
import 'package:fusion/screens/home/slider_card.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/navigator.dart';

class RestaurantHome extends StatelessWidget {
  const RestaurantHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    "New Booking!",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25.3799991607666,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff111111),
                      height: 38 / 25.3799991607666,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SliderCard(),
                      Container(height: 10),
                      AppBtn(
                        onPressed: () {
                          back(context);
                        },
                        width: 0.5,
                        title: "Confirmed",
                        style: const TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14.36882209777832,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff010100),
                          height: 21 / 14.36882209777832,
                        ),
                        color: Colors.green,
                      ),
                      SizedBox(height: 10),
                      AppBtn(
                        width: 0.5,
                        title: "Cancelled",
                        style: const TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14.36882209777832,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff010100),
                          height: 21 / 14.36882209777832,
                        ),
                        color: Colors.red,
                        onPressed: () {
                          back(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Restaurant Madlyan",
                style: TextStyle(
                  fontFamily: "Jost",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff181716),
                  height: 26 / 18,
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.keyboard_arrow_down_outlined),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Table Bookings ",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                      height: 26 / 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SwitchExample(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(CupertinoIcons.bell, size: 30),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: AppConfig.height * 0.2,
                  width: AppConfig.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "10",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                          height: 26 / 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Confirmed",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                          height: 20 / 14,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  height: AppConfig.height * 0.2,
                  width: AppConfig.width * 0.2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "30",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                          height: 26 / 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Completed",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                          height: 20 / 14,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: AppConfig.height * 0.2,
                  width: AppConfig.width * 0.2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "5 ",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                          height: 30 / 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Delay",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: AppConfig.height * 0.2,
                  width: AppConfig.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "0",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                          height: 26 / 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Waiting",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                          height: 20 / 14,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: AppConfig.height * 0.2,
                    width: AppConfig.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "10",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                            height: 26 / 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Available",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                            height: 20 / 14,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: AppConfig.height * 0.2,
                    width: AppConfig.width * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "50",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                            height: 26 / 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Total",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                            height: 20 / 14,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Action Required",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                      height: 26 / 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image(image: AssetImage("assets/image/fire 1-1.png"))
              ],
            ),
            for (int a = 0; a <= 7; a++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slidable(
                  // key: const ValueKey(0),
                  startActionPane: ActionPane(
                    extentRatio: 0.3,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        borderRadius: BorderRadius.circular(12),
                        flex: 1,
                        onPressed: doNothing,
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.close,
                        label: 'Cancelled',
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    extentRatio: 0.3,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        borderRadius: BorderRadius.circular(12),
                        onPressed: doNothing,
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        icon: Icons.done,
                        label: 'Confirmed',
                      ),
                    ],
                  ),
                  child: const SliderCard(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {}
}
