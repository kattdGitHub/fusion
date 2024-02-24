import 'package:flutter/material.dart';
import 'package:fusion/utils/app_btn.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(
            fontFamily: "Jost",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
            height: 29 / 20,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: Container(
        color: Colors.white70,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 16,
                        width: 16,
                        child: const Image(
                          image: AssetImage("assets/icons/group 1.png"),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Number of Guest:",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                          height: 20 / 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: const Text("10",
                            style: TextStyle(
                              height: 20 / 14,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 16,
                        width: 16,
                        child: const Image(
                          image: AssetImage("assets/icons/clock 1.png"),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Time Allowed:",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                          height: 20 / 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: const Text(
                        "2 Hours",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                          height: 17 / 12,
                        ),
                        textAlign: TextAlign.left,
                      )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBtn(
            title: "Save",
            style: TextStyle(
              fontFamily: "Jost",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 26 / 18,
            ),
          ),
          AppBtn(
            title: "Edit",
            style: TextStyle(
              fontFamily: "Jost",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xffbd8d46),
              height: 26 / 18,
            ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
