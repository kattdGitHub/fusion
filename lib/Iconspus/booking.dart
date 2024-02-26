import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:fusion/screens/home/slider_card.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Restaurant Madlyan",
            style: const TextStyle(
              fontFamily: "Jost",
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xff181716),
              height: 26 / 18,
            ),
            textAlign: TextAlign.left,
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.search, color: Colors.deepOrange),
                          iconColor: Colors.deepOrange,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.deepOrange),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.deepOrange),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.deepOrange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: 'Type guest name or Booking ID',
                          hintStyle: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff989898),
                            height: 17 / 12,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage("assets/image/setting-4.png"),
                        width: 25,
                        height: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Bookings",
                style: const TextStyle(
                  fontFamily: "Jost",
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                  height: 32 / 22,
                ),
                textAlign: TextAlign.center,
              ),
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
                  child: SliderCard(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {}
}
