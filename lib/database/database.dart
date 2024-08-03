import 'dart:convert';
import 'package:bookstore_app/models/book.dart';
import 'package:http/http.dart' as http;

Future<http.Response> user_login(String email, String password) async {
  final url =
      Uri.parse('http://127.0.0.1:5000/users?email=$email&password=$password');
  final response = await http.get(
    url,
    headers: {'Content-Type': 'application/json'},
  );
  return response;
}

Future<http.Response> create_User(
    String email, String password, String name) async {
  final url = Uri.parse('http://127.0.0.1:5000/users');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'email': email, 'password': password, 'name': name,'type' : 'user'}),
  );
  return response;
}

Future<http.Response> get_all_libraries() async {
  final url = Uri.parse('http://127.0.0.1:5000/library');
  final response = await http.get(
    url,
    headers: {'Content-Type': 'application/json'},
  );
  return response;
}

Future<http.Response> get_libraries_location(String location) async {
  final url =
      Uri.parse('http://127.0.0.1:5000/library/location?location=$location');
  final response = await http.get(
    url,
    headers: {'Content-Type': 'application/json'},
  );
  return response;
}

Future<http.Response> add_Book(String title, String author, String description,
  double price, Genre genre, int libraryID, String imageUrl) async {
  final url = Uri.parse('http://127.0.0.1:5000/books');
  return await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'title': title,
      'author': author,
      'description': description,
      'price': price,
      'genre': toString(genre),
      'library': libraryID,
      'url': url
    },
    ),
  );
}

Future<http.Response> delete_book(int bookID) async {
  final url = Uri.parse('http://127.0.0.1:5000/books?id=$bookID');
  final response = await http.delete(
    url,
    headers: {'Content-Type': 'application/json'},
  );
  return response;
}

Future<http.Response> get_all_books() async {
  final url = Uri.parse('http://127.0.0.1:5000/books');
  final response = await http.get(
    url,
    headers: {'Content-Type': 'application/json'},
  );
  return response;
}

Future<http.Response> get_books_library(int LibraryID) async {
  final url = Uri.parse('http://127.0.0.1:5000/books/lib?id=$LibraryID');
  final response = await http.get(
    url,
    headers: {'Content-Type': 'application/json'},
  );
  return response;
}
