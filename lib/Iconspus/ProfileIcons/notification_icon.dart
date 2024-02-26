import 'package:flutter/material.dart';

class Notification_icons extends StatefulWidget {
  const Notification_icons({super.key});

  @override
  State<Notification_icons> createState() => _Notification_iconsState();
}

class _Notification_iconsState extends State<Notification_icons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Notification",
          style: const TextStyle(
            fontFamily: "Jost",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
            height: 26 / 18,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              for (int a = 0; a <= 6; a++)
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Image(
                          image: AssetImage(
                            "assets/image/Rectanglefood.png",
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cheema Restaurant",
                          style: const TextStyle(
                            fontFamily: "Jost",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            height: 23 / 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "10, Aug 2023",
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff383838),
                            height: 15 / 10,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Booking status is canceled by cheema  Restaurant",
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                            height: 28 / 10,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
