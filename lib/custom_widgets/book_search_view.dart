import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../pages/book_page.dart';
import '../provider/app_provider.dart';

class BookSearchView extends StatelessWidget {
  BookSearchView({super.key,required this.book});
  Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<AppProvider>(context,listen: false).selectedBook = book;
        context.goNamed(BookPage.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 5
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(book.imageURl,width: 75, height: 150,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(book.title,style: TextStyle(color: Colors.blueGrey[600],fontWeight: FontWeight.bold,fontSize: 18),),
                          Text('by ${book.author}',style: TextStyle(color: Colors.blueGrey[600]),)
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15
                  ),
                  child: Text('\$${book.price}',style: TextStyle(color: Colors.blueGrey[600],fontWeight: FontWeight.bold,fontSize: 16),),
                ),
              ],
            ),
            const Divider(thickness: 2,height: 2,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
