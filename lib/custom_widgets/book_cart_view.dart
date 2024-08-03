import 'package:bookstore_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';

class BookCartView extends StatelessWidget {
  Book book;
  BookCartView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10
      ),
      child: Column(
        children: [
          SizedBox(
            height: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: VerticalDivider(width: 2,thickness: 2,color: Colors.red[900],),
                    ),
                    Text('1x',style: TextStyle(color: Colors.blueGrey[600],fontWeight: FontWeight.bold),),
                    const SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(book.title,style: TextStyle(color: Colors.blueGrey[600],fontWeight: FontWeight.bold),),
                        Text('by ${book.author}',style: TextStyle(color: Colors.blueGrey[600],fontSize: 12),),
                        Text('\$${book.price}',style: TextStyle(color: Colors.blueGrey[600],fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.network(
                      book.imageURl,
                      height: 200,
                      width: 100,
                    ),
                    Positioned(
                      right: -10,
                      top: -10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Provider.of<AppProvider>(context,listen: false).removeFromShoppingCart(book);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.brown[100],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(thickness: 2,height: 2,color: Colors.white,)
        ],
      ),
    );
  }
}
