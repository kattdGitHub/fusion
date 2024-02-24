import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fusion/Iconspus/MenuPage/add_menu.dart';
import 'package:fusion/screens/home/slider_card.dart';
import 'package:fusion/utils/navigator.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Menu",
            style: const TextStyle(
              fontFamily: "Jost",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
              height: 29 / 20,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int a = 0; a <= 7; a++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slidable(
                  // key: const ValueKey(0),

                  endActionPane: ActionPane(
                    extentRatio: 0.4,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        borderRadius: BorderRadius.circular(12),
                        onPressed: (context) {
                          pushTo(context, AddMenu());
                        },
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        icon: Icons.browser_updated_outlined,
                        label: 'Update',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SlidableAction(
                        borderRadius: BorderRadius.circular(12),
                        onPressed: doNothing,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                              image: AssetImage(
                                  "assets/image/Rectangle 42005.png")),
                        ),
                        Column(
                          children: [
                            Text(
                              "Tabbouleh",
                              style: const TextStyle(
                                fontFamily: "Jost",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff010101),
                                height: 20 / 14,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Price \$${"10"}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                height: 20 / 14,
                              ),
                              textAlign: TextAlign.left,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepOrange,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {}
}
