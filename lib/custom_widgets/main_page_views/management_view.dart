import 'package:bookstore_app/custom_widgets/library_view.dart';
import 'package:bookstore_app/pages/library_management_page.dart';
import 'package:bookstore_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ManagementView extends StatefulWidget {
  const ManagementView({super.key});

  @override
  State<ManagementView> createState() => _ManagementViewState();
}

class _ManagementViewState extends State<ManagementView> {
  @override
  void initState() {
    super.initState();
    // Provider.of<AppProvider>(context,listen: false).getAllLibraries();
    Provider.of<AppProvider>(context,listen: false).adminLibrary();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Libraries',
            style: TextStyle(
                color: Colors.blueGrey[600],
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          //ListView All Libraries related to this admin
          Expanded(
            child: Consumer<AppProvider>(builder: (BuildContext context, AppProvider appProvider, Widget? child) {
              return ListView.builder(
                itemCount: appProvider.libraries.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    Provider.of<AppProvider>(context,listen: false).selectedLibrary = appProvider.libraries[index];
                    context.goNamed(LibraryManagementPage.routeName);
                  },
                  child: LibraryView(library: appProvider.libraries[index] ,),
                ),
              );
            },),
          ),
        ],
      ),
    );
  }
}
