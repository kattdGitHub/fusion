import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      border: Border.all(
          color: Colors.black

      )
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //   "John Smith",
              //   style: TextStyle(
              //     fontFamily: "Jost",
              //     fontSize: 16,
              //     fontWeight: FontWeight.w500,
              //     color: Color(0xff000000),
              //     height: 23 / 16,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              Row(
                children: [
                  Text(
                    "9 mins delay",
                    style: TextStyle(
                      fontFamily: "Jost",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 17 / 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.phone_in_talk_rounded),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Booking ID : 245871",
            style: TextStyle(
              fontFamily: "Jost",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 17 / 12,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              customItem("Guests", "06"),
              const SizedBox(
                width: 20,
              ),
              customItem("Date", "22 Feb"),
              const SizedBox(
                width: 20,
              ),
              customItem("Time", "10:30PM"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Special Notes: ",
                style: TextStyle(
                  fontFamily: "Jost",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffbd8d46),
                  height: 20 / 14,
                ),
                textAlign: TextAlign.left,
              ),
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  "Restaurant Madlyan is a cozy...",
                  style: TextStyle(
                    fontFamily: "Jost",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff777777),
                    height: 20 / 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Expanded customItem(String title, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: "Jost",
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: "Jost",
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
