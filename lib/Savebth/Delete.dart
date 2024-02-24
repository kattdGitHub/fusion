import 'package:flutter/material.dart';
import 'package:fusion/Savebth/savebtn.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:fusion/screens/home/slider_card.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/navigator.dart';

class Delete extends StatefulWidget {
  const Delete({super.key});

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Text(
        "Delete",
        style: TextStyle(
          fontFamily: "Jost",
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: Color(0xff1e1d1d),
          height: 28 / 22,
        ),
        textAlign: TextAlign.center,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/icons/warning-2.png"),
                  )
                ],
              ),
              content: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "  Are you sure you want to\n    Delete restaurant?",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.deepOrange,
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            onPressed: () {
                              pushTo(context, RestaurantMadlyan());
                            },
                            child: const SizedBox(
                              width: 37,
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                  fontFamily: "Jost",
                                  fontSize: 21.375,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff010100),
                                  height: 31 / 21.375,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                  Colors.white70,
                                ),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                back(context);
                              },
                              child: const SizedBox(
                                width: 37,
                                child: Text(
                                  "No",
                                  style: const TextStyle(
                                    fontFamily: "Jost",
                                    fontSize: 21.375,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                    height: 31 / 21.375,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
