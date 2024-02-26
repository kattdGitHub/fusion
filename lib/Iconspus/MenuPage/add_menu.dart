import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Iconspus/MenuPage/menu.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/navigator.dart';

class AddMenu extends StatelessWidget {
  const AddMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Menu",
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Name of the dish",
                style: TextStyle(
                  fontFamily: "Jost",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff777777),
                  height: 20 / 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Quantity",
                style: TextStyle(
                  fontFamily: "Jost",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff777777),
                  height: 20 / 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Price",
                style: TextStyle(
                  fontFamily: "Jost",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff777777),
                  height: 20 / 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Description",
                style: TextStyle(
                  fontFamily: "Jost",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff777777),
                  height: 20 / 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  enabled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Your Dish Photo",
                style: TextStyle(
                  fontFamily: "Jost",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff777777),
                  height: 20 / 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                padding: const EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: SizedBox(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                              image:
                                  AssetImage("assets/image/gallery-add.png")),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Choose file to upload Image",
                            style: const TextStyle(
                              fontFamily: "Jost",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff777777),
                              height: 16 / 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    height: 200,
                    width: AppConfig.width,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AppBtn(
          title: "Save",
          style: TextStyle(
            fontFamily: "Jost",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 26 / 18,
          ),onPressed:() {
            pushTo(context, MenuPage(),);
          },
        ),
      ),
    );
  }
}
