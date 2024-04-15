import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/data/DebitCard.dart';
import '../data/CardProduct.dart';
import '../data/DataBase.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({super.key, required this.onNavigateAction, required this.onConfirmAction});

  final Function onNavigateAction;
  final Function onConfirmAction;

  @override
  _ProfileScreenWidgetState createState() => _ProfileScreenWidgetState(onNavigateAction: onNavigateAction, onConfirmAction: onConfirmAction);
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  _ProfileScreenWidgetState({required this.onNavigateAction, required this.onConfirmAction});

  final Function onNavigateAction;
  final Function onConfirmAction;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return ListView(
      children: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
            ),
            onPressed: () {
            },
            child: Row(
              children: [
                const Text(
                  'MY PURCHASES',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 18,
                      color: whiteTextColor
                  ),
                ),
                Expanded(child: Container()),
                const Icon(Icons.ad_units, size: 24, color: Colors.white),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
            ),
            onPressed: () {
            },
            child: Row(
              children: [
                const Text(
                  'MY RATE',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 18,
                      color: whiteTextColor
                  ),
                ),
                Expanded(child: Container()),
                const Icon(Icons.ad_units, size: 24, color: Colors.white),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
            ),
            onPressed: () {
            },
            child: Row(
              children: [
                const Text(
                  'PAYMENT METHOD',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 18,
                      color: whiteTextColor
                  ),
                ),
                Expanded(child: Container()),
                const Icon(Icons.ad_units, size: 24, color: Colors.white),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
            ),
            onPressed: () {
            },
            child: Row(
              children: [
                const Text(
                  'LOGOUT',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 18,
                      color: whiteTextColor
                  ),
                ),
                Expanded(child: Container()),
                const Icon(Icons.ad_units, size: 24, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}