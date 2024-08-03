import 'package:bookstore_app/pages/book_page.dart';
import 'package:bookstore_app/pages/library_management_page.dart';
import 'package:bookstore_app/pages/library_page.dart';
import 'package:bookstore_app/pages/login_page.dart';
import 'package:bookstore_app/pages/main_page.dart';
import 'package:bookstore_app/pages/register_page.dart';
import 'package:bookstore_app/pages/shopping_cart_page.dart';
import 'package:bookstore_app/pages/thank_you_page.dart';
import 'package:bookstore_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AppProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
          name: LoginPage.routeName,
          path: LoginPage.routeName,
          builder: (context, state) => const LoginPage(),
          routes: [
            GoRoute(
                name: RegisterPage.routeName,
                path: RegisterPage.routeName,
                builder: (context, state) => const RegisterPage()),
            GoRoute(
              name: MainPage.routeName,
              path: MainPage.routeName,
              builder: (context, state) => MainPage(),
              routes: [
                GoRoute(
                  path: BookPage.routeName,
                  name: BookPage.routeName,
                  builder: (context, state) => BookPage(book: Provider.of<AppProvider>(context).selectedBook,),
                ),
                GoRoute(
                  path: LibraryPage.routeName,
                  name: LibraryPage.routeName,
                  builder: (context,state) => LibraryPage(library: Provider.of<AppProvider>(context).selectedLibrary,)
                ),
                GoRoute(
                  path: ShoppingCartPage.routeName,
                  name: ShoppingCartPage.routeName,
                  builder: (context,state) => const ShoppingCartPage()
                ),
                GoRoute(
                  path: ThankYouPage.routeName,
                  name: ThankYouPage.routeName,
                  builder: (context,state) => const ThankYouPage()
                ),
                GoRoute(
                  path: LibraryManagementPage.routeName,
                  name: LibraryManagementPage.routeName,
                  builder: (context,state) => LibraryManagementPage(library: Provider.of<AppProvider>(context).selectedLibrary,)
                ),
              ],
            ),
          ]),
    ],
  );
}
