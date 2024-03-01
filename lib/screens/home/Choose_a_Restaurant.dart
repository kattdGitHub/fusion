import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion/Restaurant/add_restaurant.dart';
import 'package:fusion/Screen_All/home_pageNew.dart';
import 'package:fusion/business_logic/models/restaurant_model.dart';
import 'package:fusion/dashboard/Dashboard.dart';
import 'package:fusion/screens/home/restaurant_home_page.dart';
import 'package:fusion/utils/navigator.dart';

final list = [
  "Brazil",
  "Italia (Disabled)",
  "Tunisia" "Brazil",
  "Italia (Disabled)",
  "Tunisia",
  'Canada'
];

class ChooseRestaurant extends StatelessWidget {
  const ChooseRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Center(
            child: Text(
              "Choose a Restaurant",
              style: const TextStyle(
                fontFamily: "Jost",
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                height: 35 / 24,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("restaurants").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final model = RestaurantModel.fromJson(
                        snapshot.data?.docs[index].data() ?? {});
                    return ListTile(
                      onTap: () => pushTo(
                        context,
                        Dashboard(model: model),
                      ),
                      leading: buildAvatarContainer(index, model),
                      title: Text(model.name ?? ""),
                    );
                  },
                  itemCount: snapshot.data?.docs.length,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Container(
                    height: 500,
                    width: 205,
                    child: Text(
                      "${snapshot.error.toString()}",
                    ),
                  ),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.cyanAccent,
                ),
              );
            }
            return SizedBox();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pushTo(context, AddRestaurant());
          },
          child: Icon(
            CupertinoIcons.add,
            size: 25.sp,
          ),
        ));
  }

  Widget buildAvatarContainer(int index, RestaurantModel user) {
    return Container(
      width: 50, // Adjust the width as per your requirement
      height: 50, // Adjust the height as per your requirement
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black), // Add border styling if needed
      ),
      child: user.image == null
          ? _buildDefaultAvatar(index)
          : _buildUserImage(user.image ?? ""),
    );
  }

  Widget _buildDefaultAvatar(int index) {
    return Center(
      child: Text("${index + 1}"),
    );
  }

  Widget _buildUserImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
