import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/main_navigator_controller.dart';
import '../boxes.dart';
import '../data/CardProduct.dart';
import '../data/DataBase.dart';
import '../data/Product.dart';

class ProductScreenWidget extends StatefulWidget {
  const ProductScreenWidget({super.key});

  @override
  _ProductScreenWidgetState createState() => _ProductScreenWidgetState();
}

class _ProductScreenWidgetState extends State<ProductScreenWidget> {
  _ProductScreenWidgetState();

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late bool _favorite;
  int _productNum = 1;

  @override
  void initState() {
    super.initState();
    _favorite = isCurrentCustomerFavoriteThisProduct(
        MainNavigatorController.arguments[
          MainNavigatorController.productScreenArgument
        ] ?? 0
    );
  }

  void _changeProductNum(bool increase) {
    setState(() {
      if (increase) {
        _productNum++;
      } else {
        if (_productNum > 1) _productNum--;
      }
    });
  }

  void _changeFavorite(int productId) {
    setState(() {
      if (!_favorite) {
        addCurrentCustomerFavorite(productId);
      }
      else {
        removeCurrentCustomerFavorite(productId);
      }
      _favorite = isCurrentCustomerFavoriteThisProduct(
          MainNavigatorController.arguments[
          MainNavigatorController.productScreenArgument
          ] ?? 0
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    int productId = MainNavigatorController.arguments[
      MainNavigatorController.productScreenArgument
    ] ?? 0;
    Product product = Product(id: 0, name: "", price: 0, status: "", image: "", categoryId: 1, subCategoryId: 1);
    for (Product p in DataBase.products) {
      if (p.id == productId) product = p;
    }

    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Image.network(
                "https://th.bing.com/th/id/OIP.YAXlTjvtEKchdMVc5laZhwHaE8?rs=1&pid=ImgDetMain",
                height: height * 0.5,
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
              const SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: (height / 2) * 0.6
                    ),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: blueTextColor
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                    '${product.price} EGP',
                    style: const TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: blueTextColor
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  Text(
                    '${product.price} ⭐ 4.8',
                    style: const TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: blueTextColor
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(height: 4.0),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                '${product.price} fgfhv hg jhj kuh huhhfhdhgujh iuj uhkhukjghhgjkhb uh gftguhuijh hujhuh uhuhu uhuyuyu cv dsrgdt rdssxesefed eewxedf rexs',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: blueTextColor
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(child: Container()),
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
                        onPressed: () => _changeProductNum(false),
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
                      '$_productNum',
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
                        onPressed: () => _changeProductNum(true),
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
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Add to card'),
                                content: const Text('Do you want to add this order to the card?.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      DataBase.card.cardProducts.add(
                                          CardProduct(product: product, quantity: _productNum)
                                      );
                                      setState(() => _productNum = 1);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          );
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
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () async {
                      _changeFavorite(productId);
                    },
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: _favorite
                          ? const Icon(Icons.favorite, size: 33, color: Colors.red)
                          : const Icon(Icons.favorite_border, size: 33, color: Colors.grey)
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}