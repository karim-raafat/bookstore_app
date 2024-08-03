import 'package:bookstore_app/models/library.dart';
import 'package:flutter/material.dart';

class LibraryView extends StatelessWidget {
  Library library;

  LibraryView({super.key,required this.library});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                          library.imageURL,
                        ),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      library.name,
                      style: TextStyle(
                          color: Colors.blueGrey[600],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('Location: ${library.location}',style: TextStyle(color: Colors.blueGrey[600],fontSize: 14),),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 2,
            color: Colors.white,
            height: 2,
          )
        ],
      ),
    );
  }
}
