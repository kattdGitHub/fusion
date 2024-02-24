import 'package:flutter/material.dart';

import 'package:fusion/utils/app_btn.dart';


class Locationview extends StatelessWidget {
  const Locationview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 125,
                ),
                child: SizedBox(
                  width: 276,
                  height: 90,
                  child: Center(
                    child: Text(
                      "Reserva uses your location to help you find great restaurant     \n         near by your home ",
                      style: TextStyle(
                        fontFamily: "Jost",
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 262,
                      width: 262,
                      child: const Image(
                          image: AssetImage(
                              "assets/image/—Pngtree—pin location icon with folded_7581594 1.png"))),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              AppBtn(
                title: "Allow Access",
                width: 0.9,
                style: TextStyle(color: Colors.white),
                // height: ,
                onPressed: () {

                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {

                  },
                  child: const Text(
                    "NOT NOW",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff374850),
                      height: 20 / 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
