import 'package:bookstore_app/custom_widgets/book_search_view.dart';
import 'package:bookstore_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/library.dart';

class LibraryPage extends StatefulWidget {
  Library library;
  static final String routeName = 'library';

  LibraryPage({super.key, required this.library});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context,listen: false).getBooksLibrary(widget.library.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Card(
                color: Colors.brown[100],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blueGrey,
                            ),
                            child: IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.brown[100],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        widget.library.imageURL,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.library.name,
                        style: TextStyle(
                          color: Colors.blueGrey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Location: ${widget.library.location}',
                          style: TextStyle(
                            color: Colors.blueGrey[600],
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Avalaible Books in the Library',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
              
                      //Books of the Library
                      Consumer<AppProvider>(
                        builder: (BuildContext context, AppProvider appProvider,
                            Widget? child) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: appProvider.books.length,
                              itemBuilder: (context, index) => BookSearchView(
                                  book: appProvider.books[index]));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
