import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fusion/Iconspus/MenuPage/add_menu.dart';
import 'package:fusion/Iconspus/ProfileIcons/profile_page.dart';
import 'package:fusion/Restaurant/add_restaurant.dart';
import 'package:fusion/Screen_All/home_pageNew.dart';
import 'package:fusion/business_logic/models/restaurant_model.dart';
import 'package:fusion/business_logic/providers/restaurants_provider.dart';
import 'package:fusion/business_logic/repos/restaurants_repo.dart';
import 'package:fusion/dashboard/Dashboard.dart';
import 'package:fusion/screens/home/restaurant_home_page.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:provider/provider.dart';


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
          actions: [
            InkWell(onTap: () => pushTo(context,ProfilePage()),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.green,
                ),
              ),
            )
          ],
        ),
        body: Consumer<RestaurantsProvider>(builder: (context, provider, child) {
          return StreamBuilder(
            stream: RestaurantsRepo.restaurantsCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final restaurantModel= RestaurantModel.fromJson(
                        snapshot.data?.docs[index].data() ?? {},
                      );
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Slidable(
                          endActionPane: ActionPane(
                            extentRatio: 0.6,
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                borderRadius: BorderRadius.circular(12),
                                onPressed: (context) {
                                  pushTo(
                                      context,
                                      AddRestaurant());
                                },
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Edit',
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SlidableAction(
                                borderRadius: BorderRadius.circular(12),
                                onPressed: (context) => provider.deleteMenu(
                                  restaurantModel.id ?? '',
                                ),
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
                                if (provider.restarurantIdLoading == restaurantModel.id)
                                  CircularProgressIndicator()
                                else ...{
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  restaurantModel.image ?? ''))),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        restaurantModel.name ?? "",
                                        style: const TextStyle(
                                          fontFamily: "Jost",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff010101),
                                          height: 20 / 14,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),

                                    ],
                                  ),
                                }
                              ],
                            ),
                          ),
                        ),
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
                  child: Container(
                    color: Colors.cyanAccent,
                  ),
                );
              }
              return SizedBox();
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pushTo(context, AddRestaurant());
          },backgroundColor: Colors.green,
          child: Icon(
            CupertinoIcons.add,color: Colors.white,
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
