import 'package:bookstore_app/custom_widgets/book_view.dart';
import 'package:bookstore_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SectionView extends StatelessWidget {
  String title;

  SectionView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(color: Colors.blueGrey[600],fontWeight: FontWeight.bold,fontSize: 20,),),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.42,
            child: Consumer<AppProvider>(builder: (BuildContext context, AppProvider appProvider, Widget? child) {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: appProvider.books.length,
                itemBuilder: (context,index) => BookView(book: appProvider.books[index]),
              );
            },),
          ),

        ],
      ),
    );
  }
}
