import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/data/DebitCard.dart';
import '../data/CardProduct.dart';
import '../data/DataBase.dart';

class CardScreenWidget extends StatefulWidget {
  const CardScreenWidget({super.key, required this.onNavigateAction, required this.onConfirmAction});

  final Function onNavigateAction;
  final Function onConfirmAction;

  @override
  _CardScreenWidgetState createState() => _CardScreenWidgetState(onNavigateAction: onNavigateAction, onConfirmAction: onConfirmAction);
}

class _CardScreenWidgetState extends State<CardScreenWidget> {
  _CardScreenWidgetState({required this.onNavigateAction, required this.onConfirmAction});

  final Function onNavigateAction;
  final Function onConfirmAction;

  final List<DebitCard> debitList = [
    // DataBase.debitCards[0],
    // DataBase.debitCards[1]
  ];

  void _changeProductNum(bool increase, int productIndex) {
    setState(() {
      if (increase) {
        DataBase.card.cardProducts[productIndex].quantity++;
      } else {
        if (DataBase.card.cardProducts[productIndex].quantity > 1) {
          DataBase.card.cardProducts[productIndex].quantity--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return StreamBuilder<List<CardProduct>>(
      stream: Stream.fromIterable([DataBase.card.cardProducts]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Center(
                child: Text(
                  "No data",
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 14,
                      color: blueTextColor
                  ),
                )
            );
          }
          else {
            double currentScreenWidth = height / 2;
            double itemWidth = currentScreenWidth * 0.35;
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 8);
                    },
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        onNavigateAction(snapshot.data?[index].product.id);
                      },
                      child: Container(
                        child: SizedBox(
                          height: itemWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "https://th.bing.com/th/id/OIP.YAXlTjvtEKchdMVc5laZhwHaE8?rs=1&pid=ImgDetMain",
                                  width: itemWidth,
                                  height: itemWidth,
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
                              ),
                              SizedBox(
                                width: itemWidth * 5 / 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${snapshot.data?[index].product.name}',
                                      style: const TextStyle(
                                          fontFamily: 'Pacifico',
                                          fontSize: 14,
                                          color: blueTextColor
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Text(
                                      '${snapshot.data?[index].product.price} EGP',
                                      style: const TextStyle(
                                          fontFamily: 'Pacifico',
                                          fontSize: 14,
                                          color: blueTextColor
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                      width: (35 + 45 + 35),
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              DataBase.card.cardProducts.removeAt(index);
                                            });
                                          },
                                          child: const Icon(Icons.cancel_outlined, size: 20, color: Colors.black,)
                                      )
                                  ),
                                  Expanded(child: Container()),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: TextButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                              ),
                                            ),
                                            onPressed: () => _changeProductNum(false, index),
                                            child: const Text(
                                              '-',
                                              style: TextStyle(
                                                  fontFamily: 'Pacifico',
                                                  fontSize: 14,
                                                  color: whiteTextColor
                                              ),
                                            )
                                        ),
                                      ),
                                      SizedBox(
                                        width: 45,
                                        child: Text(
                                          '${snapshot.data?[index].quantity}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontFamily: 'Pacifico',
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: blueTextColor
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: TextButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                              ),
                                            ),
                                            onPressed: () => _changeProductNum(true, index),
                                            child: const Text(
                                              '+',
                                              style: TextStyle(
                                                  fontFamily: 'Pacifico',
                                                  fontSize: 14,
                                                  color: whiteTextColor
                                              ),
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    itemCount: snapshot.data?.length ?? 0,
                  ),
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
                SizedBox(
                  height: 35.0 * debitList.length,
                  child: Container(
                    child: ListView.builder(
                      itemCount: debitList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Code ${(index + 1)} :",
                                  style: const TextStyle(
                                      fontFamily: 'Pacifico',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: blackTextColor
                                  ),
                                ),
                                Expanded(child: Container()),
                                Text(
                                  "${debitList[index].value} EGP",
                                  style: const TextStyle(
                                      fontFamily: 'Pacifico',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: blackTextColor
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        );
                      },
                    ),
                  ),
                ),
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
                const SizedBox(height: 24),
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
                        onConfirmAction();
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
            );
          }
        }
        else {
          return const Center(
              child: Text(
                "No data",
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 14,
                    color: blueTextColor
                ),
              )
          );
        }
      },
    );
  }
}