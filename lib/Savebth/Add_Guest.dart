import 'package:flutter/material.dart';
import 'package:fusion/utils/app_btn.dart';

class Add_Guest extends StatelessWidget {
  const Add_Guest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Guest Details",
          style: TextStyle(
            fontFamily: "Jost",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
            height: 29 / 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Number of guests allowed",
                style: const TextStyle(
                  fontFamily: "Jost",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff777777),
                  height: 17 / 12,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Estimated time ",
                style: const TextStyle(
                  fontFamily: "Jost",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff777777),
                  height: 17 / 12,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int a = 0; a <= 10; a++)
                      Container(
                        height: 100,
                        child: Conter(1),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppBtn(
          title: "Continue",
          style: const TextStyle(
            fontFamily: "Jost",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 26 / 18,
          ),
        ),
      ),
    );
  }
}

Widget Conter(int index) => Container(
      width: 100,
      height: 100,
      child: Text(
        "30 min",
        style: const TextStyle(
          fontFamily: "Jost",
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xff000000),
          height: 17 / 12,
        ),
        textAlign: TextAlign.left,
      ),
    );
