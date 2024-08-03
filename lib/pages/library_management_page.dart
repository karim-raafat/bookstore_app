import 'package:bookstore_app/models/user.dart';
import 'package:bookstore_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/book_search_view.dart';
import '../models/book.dart';
import '../models/library.dart';

class LibraryManagementPage extends StatefulWidget {
  Library library;
  static final String routeName = 'management';

  LibraryManagementPage({super.key, required this.library});

  @override
  State<LibraryManagementPage> createState() => _LibraryManagementPageState();
}

class _LibraryManagementPageState extends State<LibraryManagementPage> {
  String genre = 'Horror';

  TextEditingController titleController = TextEditingController();

  TextEditingController authorController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context, listen: false)
        .getBooksLibrary(widget.library.id);
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
            child: Card(
              color: Colors.brown[100],
              child: SingleChildScrollView(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Avalaible Books in the Library',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blueGrey,
                            ),
                            child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.brown[100],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    context: context,
                                    builder: (context) =>
                                        SafeArea(child: StatefulBuilder(
                                          builder: (BuildContext context,
                                              void Function(void Function())
                                                  setState) {
                                            return SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Add New Book',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .blueGrey[600],
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    TextFormField(
                                                      controller:
                                                          titleController,
                                                      style: TextStyle(
                                                          color: Colors
                                                              .blueGrey[600]),
                                                      cursorColor:
                                                          Colors.blueGrey[600],
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              'Book Title',
                                                          prefixIcon:
                                                              const Icon(Icons.title),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.brown[100],
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextFormField(
                                                      controller:
                                                          authorController,
                                                      style: TextStyle(
                                                          color: Colors
                                                              .blueGrey[600]),
                                                      cursorColor:
                                                          Colors.blueGrey[600],
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              'Author\'s name',
                                                          prefixIcon: const Icon(
                                                              Icons.person),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.brown[100],
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextFormField(
                                                      maxLines: 5,
                                                      controller:
                                                          descriptionController,
                                                      style: TextStyle(
                                                          color: Colors
                                                              .blueGrey[600]),
                                                      cursorColor:
                                                          Colors.blueGrey[600],
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              'Book Description',
                                                          filled: true,
                                                          fillColor:
                                                              Colors.brown[100],
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextFormField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      controller:
                                                          priceController,
                                                      style: TextStyle(
                                                          color: Colors
                                                              .blueGrey[600]),
                                                      cursorColor:
                                                          Colors.blueGrey[600],
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              'Book Price',
                                                          prefixIcon: const Icon(Icons
                                                              .attach_money),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.brown[100],
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextFormField(
                                                      controller: urlController,
                                                      style: TextStyle(
                                                          color: Colors
                                                              .blueGrey[600]),
                                                      cursorColor:
                                                          Colors.blueGrey[600],
                                                      decoration: InputDecoration(
                                                          hintText: 'Image Url',
                                                          prefixIcon:
                                                              const Icon(Icons.image),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.brown[100],
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Genre',
                                                          style: TextStyle(
                                                              color: Colors
                                                                      .blueGrey[
                                                                  600],
                                                              fontSize: 16),
                                                        ),
                                                        DropdownButton<String>(
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          autofocus: true,
                                                          dropdownColor: Colors
                                                              .blueGrey[600],
                                                          focusColor: Colors
                                                              .blueGrey[600],
                                                          value: Provider.of<
                                                                      AppProvider>(
                                                                  context)
                                                              .genre,
                                                          items: const [
                                                             DropdownMenuItem(
                                                              value: 'Horror',
                                                              child: Text(
                                                                  'Horror'),
                                                            ),
                                                             DropdownMenuItem(
                                                              value:
                                                                  'Adventure',
                                                              child: Text(
                                                                  'Adventure'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: 'Romance',
                                                              child: Text(
                                                                  'Romance'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: 'Sci_Fi',
                                                              child: Text(
                                                                  'Sci-Fi'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: 'Science',
                                                              child: Text(
                                                                  'Science'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: 'Drama',
                                                              child:
                                                                  Text('Drama'),
                                                            ),
                                                          ],
                                                          onChanged: (value) {
                                                            Provider.of<AppProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .genre =
                                                                value as String;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {
                                                            context.pop();
                                                          },
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors.red[900],
                                                          ),
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .brown[
                                                                    100]),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Provider.of<AppProvider>(context, listen: false).addBook(
                                                                context,
                                                                titleController
                                                                    .text,
                                                                authorController
                                                                    .text,
                                                                descriptionController
                                                                    .text,
                                                                double.parse(
                                                                    priceController
                                                                        .text),
                                                                toGenre(Provider.of<AppProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .genre),
                                                                Provider.of<AppProvider>(
                                                                        context,listen: false)
                                                                    .selectedLibrary
                                                                    .id,
                                                                urlController
                                                                    .text);
                                                            context.pop();
                                                          },
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors.blueGrey,
                                                          ),
                                                          child: Text(
                                                            'Add Book',
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .brown[
                                                                    100]),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        )));
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.brown[100],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Consumer<AppProvider>(
                        builder: (BuildContext context, AppProvider appProvider,
                            Widget? child) {
                          return ListView.builder(
                            itemCount: appProvider.books.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: BookSearchView(
                                      book: appProvider.books[index],
                                    ),
                                  ),
                                  if (Provider.of<AppProvider>(context,
                                              listen: false)
                                          .loggedUser
                                          .type ==
                                      UserType.admin)
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blueGrey,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          print('pressed');
                                          appProvider.deleteBook(
                                              appProvider.books[index]);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.brown[100],
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          );
                        },
                      )

                      //Books of the Library
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
