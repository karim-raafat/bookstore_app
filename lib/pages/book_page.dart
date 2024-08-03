import 'package:bookstore_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';

class BookPage extends StatelessWidget {
  static final String routeName = 'book';
  Book book;

  BookPage({super.key,required this.book});

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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Expanded(
                            child: Image.network(
                              book.imageURl,
                              width: 150,
                              height: 300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        book.title,
                        style: TextStyle(
                          color: Colors.blueGrey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'by ${book.author}',
                              style: TextStyle(
                                color: Colors.blueGrey[600],
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Text(
                            'Genre: ${toString(book.genre)}',
                            style: TextStyle(
                              color: Colors.blueGrey[600],
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 2,thickness: 2,color: Colors.white,),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          book.description,
                          style: TextStyle(
                            color: Colors.blueGrey[600],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                //Go to Checkout
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blueGrey,

                              ),
                              child: Text('Buy Now',style: TextStyle(color: Colors.brown[100]),),
                            ),
                            Text('\$${book.price}',style: TextStyle(color: Colors.blueGrey[600],fontWeight: FontWeight.bold,fontSize: 15),),
                            TextButton(
                              onPressed: () {
                                Provider.of<AppProvider>(context,listen: false).addToShoppingCart(book);
                                context.pop();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blueGrey,

                              ),
                              child: Text('Add to Cart',style: TextStyle(color: Colors.brown[100]),),
                            ),
                          ],
                        ),
                      ),
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
