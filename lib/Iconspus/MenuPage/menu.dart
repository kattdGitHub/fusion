import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fusion/Iconspus/MenuPage/add_menu.dart';
import 'package:fusion/business_logic/models/menu_model.dart';
import 'package:fusion/business_logic/models/restaurant_model.dart';
import 'package:fusion/business_logic/providers/menu_provider.dart';
import 'package:fusion/business_logic/repos/menu_repo.dart';
import 'package:fusion/dashboard/Dashboard.dart';
import 'package:fusion/screens/home/slider_card.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key, required this.model});

  final RestaurantModel model;

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
      body: Consumer<MenuProvider>(builder: (context, provider, child) {
        return StreamBuilder(
          stream: MenuRepo.menuCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final menuModel = MenuModel.fromJson(
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
                                    AddEditMenuScreen(
                                      model: model,
                                      menuModel: menuModel,
                                    ));
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
                                menuModel.id ?? '',
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
                              if (provider.menuIdLoading == menuModel.id)
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
                                                menuModel.image ?? ''))),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      menuModel.name ?? "",
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
                                      "Price \$${menuModel.price ?? ""}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        height: 20 / 14,
                                      ),
                                      textAlign: TextAlign.left,
                                    )
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
        backgroundColor: Colors.green,
        child: Icon(
          CupertinoIcons.add,
          color: Colors.white,
          size: 30.sp,
        ),
        onPressed: () {
          pushTo(context, AddEditMenuScreen(model: model));
          context.read<MenuProvider>().clear(
              );
        }
      ),
    );
  }
}
