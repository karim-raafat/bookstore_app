import 'package:bookstore_app/custom_widgets/section_view.dart';
import 'package:bookstore_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {
@override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context,listen: false).getAllBooks();

  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SectionView(title: 'Just for You'),
          SectionView(title: 'Bestseller'),
        ],
      ),
    );
  }
}
