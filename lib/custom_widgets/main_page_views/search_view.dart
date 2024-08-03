import 'package:bookstore_app/custom_widgets/book_search_view.dart';
import 'package:bookstore_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context,listen: false).getAllBooks();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (BuildContext context, AppProvider appProvider, Widget? child) {
      return ListView.builder(
        shrinkWrap: true,
        // scrollDirection: Axis.horizontal,
        itemCount: appProvider.books.length,
        itemBuilder: (context,index) => BookSearchView(book: appProvider.books[index]),
      );
    },);
  }
}
