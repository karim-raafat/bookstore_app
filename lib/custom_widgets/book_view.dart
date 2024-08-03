import 'package:bookstore_app/pages/book_page.dart';
import 'package:bookstore_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';

class BookView extends StatelessWidget {
  BookView({super.key, required this.book});
  Book book;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: (){
            Provider.of<AppProvider>(context,listen: false).selectedBook = book;
            context.goNamed(BookPage.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        book.imageURl,
                        height: 200,
                        width: 100,
                      ),
                      Text(book.title,style: TextStyle(color: Colors.blueGrey[600],fontWeight: FontWeight.bold),),
                      Text('by ${book.author}',style: TextStyle(color: Colors.blueGrey[600],fontSize: 12),),

                      Text('\$${book.price}',style: TextStyle(color: Colors.blueGrey[600],fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                const VerticalDivider(thickness: 2,color: Colors.white,width: 2,)
              ],
            ),
          ),
        ),
        Positioned(
          top: 15,
          child: GestureDetector(
            onTap: (){
              Provider.of<AppProvider>(context,listen: false).addToWishlist(book);
            },
            child: Container(
              width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Consumer<AppProvider>(builder: (BuildContext context, AppProvider value, Widget? child) {
                  return Icon(
                    (book.wishList)? Icons.favorite : Icons.favorite_outline,
                    color: Colors.white,
                    size: 20,
                  );
                },),
            ),
          ),
        ),
      ],
    );
  }
}
