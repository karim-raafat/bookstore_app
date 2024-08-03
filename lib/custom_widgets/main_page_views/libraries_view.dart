import 'package:bookstore_app/custom_widgets/library_view.dart';
import 'package:bookstore_app/pages/library_page.dart';
import 'package:bookstore_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyLibraryView extends StatefulWidget {
  const MyLibraryView({super.key});

  @override
  State<MyLibraryView> createState() => _MyLibraryViewState();
}

class _MyLibraryViewState extends State<MyLibraryView> {
@override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context,listen: false).getAllLibraries();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<AppProvider>(
            builder:
                (BuildContext context, AppProvider appProvider, Widget? child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.055,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: appProvider.locations.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: GestureDetector(
                      onTap: () {
                        appProvider.location = appProvider.locations[index];
                        appProvider.getLibrariesLocation();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.blueGrey),
                          color: (appProvider.location ==
                                  appProvider.locations[index])
                              ? Colors.blueGrey
                              : Colors.brown[100],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            appProvider.locations[index],
                            style: TextStyle(
                                color: (appProvider.location ==
                                        appProvider.locations[index])
                                    ? Colors.brown[100]
                                    : Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Libraries',
            style: TextStyle(
                color: Colors.blueGrey[600],
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Expanded(
            child: Consumer<AppProvider>(
              builder:
                  (BuildContext context, AppProvider appProvider, Widget? child) {
                return ListView.builder(
                  itemCount: appProvider.libraries.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: (){
                      Provider.of<AppProvider>(context,listen: false).selectedLibrary = appProvider.libraries[index];
                      context.goNamed(LibraryPage.routeName);
                    },
                    child: LibraryView(library: appProvider.libraries[index],),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
