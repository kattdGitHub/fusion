import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Iconspus/ProfileIcons/edit_profile.dart';
import 'package:fusion/business_logic/models/usermodel.dart';
import 'package:fusion/business_logic/providers/auth_provider.dart';
import 'package:fusion/business_logic/repos/auth_repo.dart';
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
      body: StreamBuilder(
          stream: AuthRepo.users
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                final userModel = UserModel.fromJson(
                    snapshot.data?.data() as Map<String, dynamic>);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () => pushTo(context, EditProfile(userModel: userModel,)),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: SizedBox(
                                  height: 57,
                                  width: 57,
                                  child: CircleAvatar(
                                    backgroundImage: userModel.image == null
                                        ? null
                                        : NetworkImage(userModel.image ?? ""),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    userModel.firstName ?? "",
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
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                child: Image(
                                  image: AssetImage(
                                      "assets/icons/shield-security.png"),
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
                                  image:
                                      AssetImage("assets/icons/About Us.png"),
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

                      ],
                    ),
                  ),
                );
              }
              else if (snapshot.hasError) {
                return Center(
                  child: SizedBox(
                    height: 500,
                    width: 205,
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  ),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.cyanAccent,
                ),
              );
            }
            return const SizedBox();
          }),
    );
  }
}
