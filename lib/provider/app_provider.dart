import 'dart:convert';

import 'package:bookstore_app/models/book.dart';
import 'package:bookstore_app/models/library.dart';
import 'package:bookstore_app/models/user.dart';
import 'package:bookstore_app/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

import '../database/database.dart';

class AppProvider extends ChangeNotifier {
  late User loggedUser = User(libraryID: 2, userID: 1, name: 'Karim', email: 'Ss', password: 'sss', type: UserType.admin);
  late Library selectedLibrary;
  late Book selectedBook;
  List<Library> libraries = [];
  List<Book> books = [];
  String _genre = 'Horror';
  List<String> locations = [
    'All Locations',
    'Nasr City',
    'First Settlement',
    'Fifth Settlement',
    'Maadi',
    'Giza',
    'Mokattam',
  ];
  List<Book> _shoppingCart = [];
  int _selectedIndex = 0;
  String _location = 'All Locations';

  double _totalPrice = 50;

  String get genre => _genre;

  set genre(String value) {
    _genre = value;
    notifyListeners();
  }

  double get totalPrice => _totalPrice;

  set totalPrice(double value) {
    _totalPrice = value;
  }

  List<Book> get shoppingCart => _shoppingCart;

  String get location => _location;

  set location(String value) {
    _location = value;
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  void addToWishlist(Book book) {
    book.wishList = !book.wishList;
    notifyListeners();
  }

  void addToShoppingCart(Book book) {
    shoppingCart.add(book);
    totalPrice += book.price;
    notifyListeners();
  }

  void removeFromShoppingCart(Book book) {
    shoppingCart.remove(book);
    totalPrice -= book.price;
    notifyListeners();
  }

  Future<void> createUser(
      BuildContext context, String email, String password, String name) async {
    await create_User(email, password, name);
    context.pop();
    notifyListeners();
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    Response response = await user_login(email, password);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      loggedUser = User(
        userID: data['id'],
        email: email,
        password: password,
        name: data['name'],
        type: toUT(
          data['type'],
        ),
        libraryID: (data['library'] == null)? -1 : (data['library']) as int,
      );
      context.goNamed(MainPage.routeName);
    }
    notifyListeners();
  }

  Future<void> getAllLibraries() async {
    libraries = [];
    Response response = await get_all_libraries();
    if (response.statusCode == 400) {
      List data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        Library lib = Library(
            id: data[i][0],
            name: data[i][2],
            location: data[i][3],
            imageURL: data[i][1]);
        libraries.add(lib);
      }
    }
    notifyListeners();
  }

  Future<void> getLibrariesLocation() async {
    if(location == 'All Locations'){
      getAllLibraries();
      return;
    }
    libraries = [];
    Response response = await get_libraries_location(location);
    if (response.statusCode == 400) {
      List data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        Library lib = Library(
            id: data[i][0],
            name: data[i][2],
            location: data[i][3],
            imageURL: data[i][1]);
        libraries.add(lib);
      }
    }
    notifyListeners();
  }

  Future<void> getAllBooks() async {
    books = [];
    Response response = await get_all_books();
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        Book book = Book(
            bookID: data[i][0],
            title: data[i][1],
            author: data[i][2],
            description: data[i][3],
            price: data[i][4],
            genre: toGenre(data[i][5]),
            imageURl: data[i][7],
            discount: 0);
        books.add(book);
      }
    }
    notifyListeners();
  }

  Future<void> getBooksLibrary(int LibraryID) async {
    books = [];
    Response response = await get_books_library(LibraryID);
    if (response.statusCode == 400) {
      List data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        Book book = Book(
            bookID: data[i][0],
            title: data[i][1],
            author: data[i][2],
            description: data[i][3],
            price: data[i][4],
            genre: toGenre(data[i][5]),
            imageURl: data[i][7],
            discount: 0);
        books.add(book);
      }
    }
    notifyListeners();
  }

  Future<void> addBook(
      BuildContext context,
      String title,
      String author,
      String description,
      double price,
      Genre genre,
      int libraryID,
      String url) async {
    await add_Book(
        title, author, description, price, genre, libraryID, url);
    getBooksLibrary(selectedLibrary.id);
  }

  void adminLibrary() async {
    await getAllLibraries();
    for(int i = 0;i<libraries.length;i++){
      if(libraries[i].id == loggedUser.libraryID) {
        libraries= [libraries[i]];
      }

    }
    notifyListeners();
  }
  Future<void> deleteBook(Book book) async{
    await delete_book(book.bookID);
    books.remove(book);
    notifyListeners();

  }
}
