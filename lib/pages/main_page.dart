import 'package:bookstore_app/custom_widgets/main_page_views/home_view.dart';
import 'package:bookstore_app/custom_widgets/main_page_views/libraries_view.dart';
import 'package:bookstore_app/custom_widgets/main_page_views/management_view.dart';
import 'package:bookstore_app/custom_widgets/main_page_views/search_view.dart';
import 'package:bookstore_app/models/user.dart';
import 'package:bookstore_app/pages/shopping_cart_page.dart';
import 'package:bookstore_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  static final String routeName = 'main';

  MainPage({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.red[900],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blueGrey[600],
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        currentIndex: Provider.of<AppProvider>(context).selectedIndex,
        onTap: (value) {
          appProvider.selectedIndex = value;
        },
        selectedItemColor: Colors.red,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'Libraries Around',
          ),
          if (appProvider.loggedUser.type == UserType.admin ||
              appProvider.loggedUser.type == UserType.librarian)
            const BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts),
              label: 'Management System',
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //User's Name
                  Text(
                    'Hello ${appProvider.loggedUser.name}!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.goNamed(ShoppingCartPage.routeName);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 30,
                                  color: Color(0xFFE0E0E0),
                                  blurStyle: BlurStyle.inner,
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 30,
                                color: Color(0xFFE0E0E0),
                                blurStyle: BlurStyle.inner,
                              ),
                            ],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
              (appProvider.selectedIndex == 0)
                  ? const Text(
                      'Looking for something new?',
                      style: TextStyle(color: Colors.white),
                    )
                  : (appProvider.selectedIndex == 1)
                      ? TextFormField(
                          controller: searchController,
                          style: TextStyle(color: Colors.blueGrey[600]),
                          cursorColor: Colors.blueGrey[600],
                          decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.brown[100],
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        )
                      : const SizedBox(),
              Expanded(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Consumer<AppProvider>(
                        builder: (BuildContext context, AppProvider value,
                            Widget? child) {
                          return Card(
                            color: Colors.brown[100],
                            child: (appProvider.selectedIndex == 0)
                                ? const HomeView()
                                : (appProvider.selectedIndex == 1)
                                    ? const SearchView()
                                    : (appProvider.selectedIndex == 2)
                                        ? const MyLibraryView()
                                        : const ManagementView(),
                          );
                        },
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
