import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/screens/login_screen.dart';

class SignUpScreen extends StatelessWidget{
  const SignUpScreen({super.key});

  static String id = 'SignUpScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: const Center(child: Text('WELCOME !')),
      ),
      body: ListView(
        children: [
          const Divider(color: Colors.black),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'F_name',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 25,
                        color: greyTextColor
                    ),
                  ),
                ),
                const TextField(
                  cursorColor: greyTextColor,
                  decoration: InputDecoration(
                      hintText: "Enter your email"
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'L_name',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 25,
                        color: greyTextColor
                    ),
                  ),
                ),
                const TextField(
                  cursorColor: greyTextColor,
                  decoration: InputDecoration(
                      hintText: "Enter your password"
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                      onPressed: (){},
                      child: const Text(
                        '  Create an account  ',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 25,
                            color: whiteTextColor
                        ),
                      )
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.pop(context,true);
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: const Text(
                        'You are already have an account ? Login',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 14,
                            color: blueTextColor
                        ),
                      )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}