import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThankYouPage extends StatelessWidget {
  static final String routeName = 'thankYou';
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Center(
        child: Card(
          color: Colors.brown[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Payment Successful!',style: TextStyle(color: Colors.blueGrey[600],fontWeight: FontWeight.bold),),
                Text('Thank you for using our Book store!',style: TextStyle(color: Colors.blueGrey[600],fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      backgroundColor: Colors.blueGrey[600]
                  ),
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Return to Home Screen',style: TextStyle(color: Colors.white),),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
