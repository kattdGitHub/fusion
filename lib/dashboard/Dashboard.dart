import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Iconspus/booking.dart';
import 'package:fusion/Iconspus/MenuPage/menu.dart';
import 'package:fusion/Iconspus/ProfileIcons/profile_page.dart';
import 'package:fusion/Restaurant/restaurant.dart';
import 'package:fusion/business_logic/providers/provider.dart';
import 'package:fusion/screens/home/restaurant_home_page.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: IndexedStack(
            index: provider.selectedIndex,
            children: [
              const RestaurantHome(),
              const MenuPage(),
              const Bookings(),
              const ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.selectedIndex,
            onTap: (v) => provider.onChanged(v),
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
                      color: provider.selectedIndex == 0 ? Colors.deepOrange : Colors.black,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color:
                            provider.selectedIndex == 0 ? Colors.deepOrange : Colors.black,
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
                      color: provider.selectedIndex == 1 ? Colors.deepOrange : Colors.black,
                    ),
                    Text(
                      "Menu",
                      style: TextStyle(
                        color:
                            provider.selectedIndex == 1 ? Colors.deepOrange : Colors.black,
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
                      color: provider.selectedIndex == 2 ? Colors.deepOrange : Colors.black,
                    ),
                    Text(
                      "Bookings",
                      style: TextStyle(
                        color:
                            provider.selectedIndex == 2 ? Colors.deepOrange : Colors.black,
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
                              provider.selectedIndex == 4 ? Colors.deepOrange : Colors.black,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            color: provider.selectedIndex == 4
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
    );
  }
}
