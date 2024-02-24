import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Iconspus/booking.dart';
import 'package:fusion/Iconspus/MenuPage/menu.dart';
import 'package:fusion/Iconspus/ProfileIcons/profile_page.dart';
import 'package:fusion/Restaurant/restaurant.dart';
import 'package:fusion/screens/home/restaurant_home_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          const RestaurantHome(),
          const MenuPage(),
          const Bookings(),
          Restaurant(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (v) => setState(() {
          selectedIndex = v;
        }),
        selectedLabelStyle: const TextStyle(
          color: Colors.deepOrange,
        ),
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Column(
              children: [
                Icon(
                  CupertinoIcons.home,
                  color: selectedIndex == 0 ? Colors.deepOrange : Colors.black,
                ),
                Text(
                  "Home",
                  style: TextStyle(
                    color:
                        selectedIndex == 0 ? Colors.deepOrange : Colors.black,
                  ),
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: "Menu",
            icon: Column(
              children: [
                Icon(
                  Icons.menu_book,
                  color: selectedIndex == 1 ? Colors.deepOrange : Colors.black,
                ),
                Text(
                  "Menu",
                  style: TextStyle(
                    color:
                        selectedIndex == 1 ? Colors.deepOrange : Colors.black,
                  ),
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: "Bookings",
            icon: Column(
              children: [
                Icon(
                  Icons.list_alt_outlined,
                  color: selectedIndex == 2 ? Colors.deepOrange : Colors.black,
                ),
                Text(
                  "Bookings",
                  style: TextStyle(
                    color:
                        selectedIndex == 2 ? Colors.deepOrange : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: "Restaurant",
            icon: Column(
              children: [
                Icon(
                  Icons.food_bank_rounded,
                  color: selectedIndex == 3 ? Colors.deepOrange : Colors.black,
                ),
                Text(
                  "Restaurant",
                  style: TextStyle(
                    color:
                        selectedIndex == 3 ? Colors.deepOrange : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Column(
              children: [
                Column(
                  children: [
                    Icon(
                      CupertinoIcons.profile_circled,
                      color:
                          selectedIndex == 4 ? Colors.deepOrange : Colors.black,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: selectedIndex == 4
                            ? Colors.deepOrange
                            : Colors.black,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
