import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/custom_widgets/web_mobile_size.dart';
import 'package:shopping/main_navigator_controller.dart';

import '../data/Category.dart';
import '../data/DataBase.dart';
import '../data/Product.dart';
import '../screens/category_screen.dart';
import '../screens/product_screen.dart';

class CategoryScreenWidget extends StatefulWidget {
  const CategoryScreenWidget({super.key, required this.onNavigateAction});

  final Function onNavigateAction;

  @override
  _CategoryScreenWidgetState createState() => _CategoryScreenWidgetState(onNavigateAction: onNavigateAction);
}

class _CategoryScreenWidgetState extends State<CategoryScreenWidget> {
  _CategoryScreenWidgetState({required this.onNavigateAction});

  final Function onNavigateAction;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<Product> currentProducts = [];
    int categoryId = MainNavigatorController.arguments[
      MainNavigatorController.categoryScreenArgument
    ] ?? 0;
    for (Product product in DataBase.products) {
      if (product.categoryId == categoryId) currentProducts.add(product);
    }

    return StreamBuilder<List<Product>>(
      stream: Stream.fromIterable([currentProducts]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          double currentScreenWidth = height / 2;
          double itemWidth = (currentScreenWidth - 40) / 3;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.08
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                onNavigateAction(snapshot.data?[index].id);
                // Navigator.pushNamed(context, ProductScreen.id, arguments: snapshot.data?[index].id);
              },
              child: Container(
                child: Column(
                  children: [
                    Image.network(
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
                    const SizedBox(height: 10.0),
                    Text(
                      '${snapshot.data?[index].name}',
                      style: const TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 14,
                          color: blueTextColor
                      ),
                    ),
                  ],
                ),
              ),
            ),
            itemCount: snapshot.data?.length ?? 0,
          );
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