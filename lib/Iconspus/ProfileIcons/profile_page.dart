import 'package:flutter/material.dart';
import 'package:fusion/Iconspus/ProfileIcons/notification_icon.dart';
import 'package:fusion/Theme/theme.dart';
import 'package:fusion/business_logic/providers/auth_provider.dart';
import 'package:fusion/screens/auth_screens/login_screen.dart';
import 'package:fusion/utils/helper_widget.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontFamily: "Jost",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
            height: 26 / 18,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 57,
                      width: 57,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/image/Ellipse 264.png",
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Alvin",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                          height: 29 / 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "My profile",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff867e7e),
                          height: 23 / 16,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Image(
                        image: AssetImage("assets/icons/file 2.png"),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Daily Overview",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff161616),
                          height: 20 / 14,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: InkWell(
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Image(
                          image:
                              AssetImage("assets/icons/notification-bing.png"),
                        ),
                      ),
                      onTap: () {
                        pushTo(context, Notification_icons());
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          pushTo(
                            context,
                            Notification_icons(),
                          );
                        },
                        child: const Text(
                          "Notification",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff161616),
                            height: 20 / 14,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                    onTap: () {
                      pushTo(
                        context,
                        Notification_icons(),
                      );
                    },
                  )
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Image(
                        image: AssetImage("assets/icons/shield-security.png"),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Privacy policy",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff161616),
                          height: 20 / 14,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Image(
                        image: AssetImage("assets/icons/About Us.png"),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "About Us",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff161616),
                          height: 20 / 14,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Icon(Icons.dehaze_outlined)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Terms and Condition",
                        style: const TextStyle(
                          fontFamily: "Jost",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff161616),
                          height: 20 / 14,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
              Consumer<AuthProvider>(
                builder:(context, provider, child){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(provider.logOutLoading)...{
                     getCustomLoading,
                  },
                      const Image(
                        image: AssetImage("assets/icons/Group 1171276084.png"),
                        width: 70,
                        height: 70,
                       ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffbd8d46),

                          ),
                          textAlign: TextAlign.left,
                        ),
                        onTap: () {
                          provider.logOut(context);
                        },
                      )
                    ],
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
