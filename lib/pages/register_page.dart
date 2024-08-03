import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';

class RegisterPage extends StatefulWidget {
  static final String routeName = 'register';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  bool isVisible = true;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),

                //Create new User
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(

                    validator: (value){

                      if(value!.isEmpty){
                        return '* Required field cannot be empty!';
                      }
                      return null;
                    },
                    controller: nameController,
                    cursorColor: Colors.red[900],
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusColor: Colors.red[900],
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Username',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF1565C0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(

                    validator: (value){
                      if(value!.isEmpty){
                        return '* Required field cannot be empty!';
                      }
                      if(!(value.contains('@') && value.contains('.com'))){
                        return '* Invalid email address';
                      }
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.red[900],
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusColor: Colors.red[900],
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF1565C0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return '* Required field cannot be empty';
                      }
                      return null;
                    },
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isVisible,
                    cursorColor: Colors.red[900],
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusColor: Colors.red[900],
                      suffixIcon: IconButton(
                        icon: (isVisible)? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                        onPressed: (){
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF1565C0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return '* Required field cannot be empty';
                      }
                      if(confirmPasswordController.text!=passwordController.text){
                        return '* Passwords are not identical';
                      }
                      return null;
                    },
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isVisible,
                    cursorColor: Colors.red[900],
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusColor: Colors.red[900],
                      suffixIcon: IconButton(
                        icon: (isVisible)? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                        onPressed: (){
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF1565C0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                //To home page
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.45,
                  child: TextButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        Provider.of<AppProvider>(context,listen: false).createUser(context,emailController.text, passwordController.text,nameController.text);
                      }
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )
                    ),
                    child: const Text('Register',style: TextStyle(color: Colors.red),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
