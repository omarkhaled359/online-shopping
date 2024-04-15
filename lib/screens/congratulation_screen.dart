import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/main_navigator_controller.dart';
import 'package:shopping/screens/login_screen.dart';

import '../custom_widgets/web_mobile_size.dart';

class CongratulationScreen extends StatelessWidget{
  const CongratulationScreen({super.key});

  static String id = 'CongratulationScreen';

  @override
  Widget build(BuildContext context) {
    return WebMobileSize(
      child: Scaffold(
        backgroundColor: kMainColor,
        body: Column(
          children: [
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'CONGRATULATION !',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: redTextColor
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Icon(Icons.ac_unit_rounded, size: 120, color: greenColor),
                  const SizedBox(height: 32),
                  const Text(
                    'Your request has been sent',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: blackTextColor
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your order number :',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: blackTextColor
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '#${112}',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: redTextColor
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'We will contact you as the shipment is arrived',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: blackTextColor
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context,true);
                          },
                          child: const Text(
                            'Follow up shopping',
                            style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: whiteTextColor
                            ),
                          ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

}