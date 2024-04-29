import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import '../boxes.dart';
import '../data/DataBase.dart';
import '../data/Product.dart';

class FavoriteScreenWidget extends StatefulWidget {
  const FavoriteScreenWidget({super.key, required this.onNavigateAction});

  final Function onNavigateAction;

  @override
  _FavoriteScreenWidgetState createState() => _FavoriteScreenWidgetState(onNavigateAction: onNavigateAction);
}

class _FavoriteScreenWidgetState extends State<FavoriteScreenWidget> {
  _FavoriteScreenWidgetState({required this.onNavigateAction});

  final Function onNavigateAction;
  List<int> favoriteList = [];

  @override
  void initState() {
    super.initState();
    favoriteList = getCurrentCustomerFavorites().favorites;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<Product> favoriteProductList = [];
    for (Product product in DataBase.products) {
      if (favoriteList.contains(product.id)) favoriteProductList.add(product);
    }

    return StreamBuilder<List<Product>>(
      stream: Stream.fromIterable([favoriteProductList]),
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
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8);
              },
              itemBuilder: (context, index) => Container(
                child: SizedBox(
                  height: itemWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          snapshot.data![index].image,
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
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: itemWidth * 9 / 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${snapshot.data?[index].name}',
                                      style: const TextStyle(
                                          fontFamily: 'Pacifico',
                                          fontSize: 14,
                                          color: blueTextColor
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Text(
                                      '${snapshot.data?[index].price} EGP',
                                      style: const TextStyle(
                                          fontFamily: 'Pacifico',
                                          fontSize: 14,
                                          color: blueTextColor
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 3),
                              Container(
                                  width: itemWidth * 1 / 7,
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          removeCurrentCustomerFavorite(favoriteProductList[index].id);
                                        });
                                      },
                                      child: const Icon(Icons.cancel_outlined, size: 20, color: Colors.black,)
                                  )
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                            width: itemWidth * (10 / 7) + 3,
                            child: TextButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                  ),
                                ),
                                onPressed: () {
                                  onNavigateAction(snapshot.data?[index].id);
                                  // Navigator.pushNamed(context, ProductScreen.id, arguments: snapshot.data?[index].id);
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Add to card',
                                      style: TextStyle(
                                          fontFamily: 'Pacifico',
                                          fontSize: 14,
                                          color: whiteTextColor
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(Icons.shopping_cart, color: whiteTextColor,)
                                  ],
                                )
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              itemCount: snapshot.data?.length ?? 0,
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