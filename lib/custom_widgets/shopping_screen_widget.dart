import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/screens/congratulation_screen.dart';
import '../data/DataBase.dart';

class ShoppingScreenWidget extends StatefulWidget {
  const ShoppingScreenWidget({super.key, required this.onRefreshAction});

  final Function onRefreshAction;

  @override
  _ShoppingScreenWidgetState createState() => _ShoppingScreenWidgetState(onRefreshAction: onRefreshAction);
}

class _ShoppingScreenWidgetState extends State<ShoppingScreenWidget> {
  _ShoppingScreenWidgetState({required this.onRefreshAction});

  final Function onRefreshAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Shopping details',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: blackTextColor
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              color: CupertinoColors.inactiveGray,
              padding: const EdgeInsets.all(4.0),
              child: Text(
                DataBase.customer.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 16,
                  color: blackTextColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: CupertinoColors.inactiveGray,
              padding: const EdgeInsets.all(4.0),
              child: Text(
                DataBase.customer.address,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 16,
                    color: blackTextColor
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Payment Method',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: blackTextColor
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              color: CupertinoColors.inactiveGray,
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  const Icon(Icons.ad_units, size: 20, color: Colors.black),
                  Expanded(child: Container()),
                  const Text(
                    "CASH",
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 16,
                        color: blackTextColor
                    ),
                  ),
                  Expanded(child: Container()),
                  const Icon(Icons.add_alert_rounded, size: 20, color: Colors.black),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Shopping Method',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: blackTextColor
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              color: CupertinoColors.inactiveGray,
              padding: const EdgeInsets.all(4.0),
              child: const Text(
                "4 : 7 DAYS",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 16,
                    color: blackTextColor
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text(
                  "Shopping expenses :",
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackTextColor
                  ),
                ),
                Expanded(child: Container()),
                const Text(
                  "100 EGP",
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackTextColor
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  "Product price :",
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackTextColor
                  ),
                ),
                Expanded(child: Container()),
                const Text(
                  "3117.64 EGP",
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackTextColor
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  "TOTAL :",
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackTextColor
                  ),
                ),
                Expanded(child: Container()),
                const Text(
                  "3217.64 EGP",
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackTextColor
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
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
                    // Navigator.pop(context,true);
                    //send the request
                    DataBase.card.cardProducts.clear();
                    onRefreshAction();

                    Navigator.pushNamed(context, CongratulationScreen.id);
                  },
                  child: const Text(
                    'send the request',
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
    );
  }
}