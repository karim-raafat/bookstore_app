import 'book.dart';

class Library {
  int id;
  String name;
  String imageURL;
  String location;
  List<Book> book = [];

  Library({required this.id,required this.name, required this.location,required this.imageURL});
}