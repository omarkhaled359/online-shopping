import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/data/CardProduct.dart';
import 'package:shopping/data/DataBase.dart';
import 'package:shopping/data/Product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  static String id = 'ProductScreen';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  _ProductScreenState();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> _favorite;
  int _productNum = 1;

  @override
  void initState() {
    super.initState();
    _favorite = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('favorite') ?? false;
    });
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

  Future<void> _changeFavorite(bool isFavorite) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _favorite = prefs.setBool('favorite', isFavorite).then((bool success) {
        return isFavorite;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = 0.0;
    if (width > height) padding = width / 2 - height / 4;

    int productId = (ModalRoute.of(context)?.settings.arguments ?? 0) as int;
    Product product = Product(id: 0, name: "", price: 0, status: "", image: "", categoryId: 1, subCategoryId: 1);
    for (Product p in DataBase.products) {
      if (p.id == productId) product = p;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Scaffold(
        backgroundColor: kMainColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          title: const Center(child: Text('WELCOME !')),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: ListView(
            children: [
              Column(
                children: [
                  Image.network(
                    "https://th.bing.com/th/id/OIP.YAXlTjvtEKchdMVc5laZhwHaE8?rs=1&pid=ImgDetMain",
                    height: height * 0.55,
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
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: blueTextColor
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
                                          print(DataBase.card);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Yes'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text(
                              'Add to card 🛒',
                              style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 14,
                                  color: whiteTextColor
                              ),
                            )
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () async {
                          bool isFavorite = !(await _favorite);
                          _changeFavorite(isFavorite);
                        },
                        child: SizedBox(
                          width: 35,
                          height: 35,
                          child: FutureBuilder<bool>(
                              future: _favorite,
                              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  // return const CircularProgressIndicator();
                                  return const SizedBox(
                                    width: 10,
                                    height: 10,
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  final bool data = snapshot.data!;
                                  return data
                                      ? const Icon(Icons.favorite, size: 33, color: Colors.red)
                                      : const Icon(Icons.favorite_border, size: 33, color: Colors.grey);
                                }
                              }
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}