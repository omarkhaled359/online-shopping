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
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.network(
                DataBase.imgProfileLink,
                width: 140,
                height: 180,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Text('Failed to load image');
                },
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    DataBase.customer.name,
                    style: const TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: blackTextColor
                    ),
                  ),
                  Text(
                    DataBase.customer.email,
                    style: const TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: greyTextColor
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
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