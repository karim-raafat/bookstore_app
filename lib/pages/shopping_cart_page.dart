import 'package:bookstore_app/custom_widgets/book_cart_view.dart';
import 'package:bookstore_app/pages/thank_you_page.dart';
import 'package:bookstore_app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatelessWidget {
  static final String routeName = 'cart';

  const ShoppingCartPage({super.key});

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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Shopping Cart',
                          style: TextStyle(
                              color: Colors.blueGrey[600],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 2,
                      height: 2,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Consumer<AppProvider>(
                        builder: (BuildContext context, AppProvider appProvider,
                            Widget? child) {
                          return ListView.builder(
                            itemCount: appProvider.shoppingCart.length,
                            itemBuilder: (context, index) => BookCartView(
                                book: appProvider.shoppingCart[index]),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Cost',
                          style: TextStyle(
                              color: Colors.blueGrey[600], fontSize: 16),
                        ),
                        Text(
                          'FREE',
                          style: TextStyle(
                              color: Colors.blueGrey[600], fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.blueGrey[600],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${Provider.of<AppProvider>(context).totalPrice}',
                          style: TextStyle(
                            color: Colors.blueGrey[600],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.9,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                backgroundColor: Colors.red[900]
                              ),
                                onPressed: () {
                                context.goNamed(ThankYouPage.routeName);
                                },
                              child: const Text('Buy Now',style: TextStyle(color: Colors.white),),),),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
