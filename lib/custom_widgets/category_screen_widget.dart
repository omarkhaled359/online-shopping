import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/custom_widgets/web_mobile_size.dart';
import 'package:shopping/data/SubCategory.dart';
import 'package:shopping/main_navigator_controller.dart';

import '../data/Category.dart';
import '../data/DataBase.dart';
import '../data/Product.dart';
import '../screens/category_screen.dart';
import '../screens/product_screen.dart';
import '../top_taps_controller.dart';

class CategoryScreenWidget extends StatefulWidget {
  const CategoryScreenWidget({
    required this.onNavigateAction,
    required this.onCategoryTabAction,
    required this.onAllTabAction
  });

  final Function onNavigateAction;
  final Function onCategoryTabAction;
  final Function onAllTabAction;

  @override
  _CategoryScreenWidgetState createState() => _CategoryScreenWidgetState(
      onNavigateAction: onNavigateAction,
      onCategoryTabAction: onCategoryTabAction,
      onAllTabAction: onAllTabAction
  );
}

class _CategoryScreenWidgetState extends State<CategoryScreenWidget> {
  _CategoryScreenWidgetState({
    required this.onNavigateAction,
    required this.onCategoryTabAction,
    required this.onAllTabAction
  });

  final Function onNavigateAction;
  final Function onCategoryTabAction;
  final Function onAllTabAction;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollToIndex(TopTapsController.categoryTabIndex);
  }

  void refresh() {
    setState(() {});
  }

  void scrollToIndex(int index) {
    _scrollController.animateTo(
      index * 116.0, // Width of Container (100) + margin (8)
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final List<Category> categoryTabTitles = [Category(id: -1, name: "All", image: DataBase.imgLink, subCategoriesIds: [])];
    for (Category category in DataBase.categories) {
      categoryTabTitles.add(category);
    }

    List<Product> currentProducts = [];
    List<SubCategory> subCategories = [];
    int categoryId = MainNavigatorController.arguments[
      MainNavigatorController.categoryScreenArgument
    ] ?? 0;

    Category myCategory = Category(id: 0, name: "", image: DataBase.imgLink, subCategoriesIds: []);

    for (Category category in DataBase.categories) {
      if (category.id == categoryId) {
        myCategory = category;
        for (SubCategory subCategory in DataBase.subCategories) {
          if (category.subCategoriesIds.contains(subCategory.id)) {
            subCategories.add(subCategory);
          }
        }
      }
    }

    for (Product product in DataBase.products) {
      if (
        product.categoryId == categoryId &&
        product.subCategoryId == subCategories[TopTapsController.subCategoryTabIndex].id
      ) {
        currentProducts.add(product);
      }
    }

    // TODO here
    scrollToIndex(6);

    return StreamBuilder<List<Product>>(
      stream: Stream.fromIterable([currentProducts]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Column(
              children: [
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryTabTitles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        child: Center(
                          child: GestureDetector(
                              onTap: () {
                                TopTapsController.categoryTabIndex = index;
                                TopTapsController.subCategoryTabIndex = 0;
                                if (categoryTabTitles[index].id == -1) {
                                  onAllTabAction();
                                }
                                else {
                                  onCategoryTabAction(categoryTabTitles[index].id);
                                }
                              },
                              child: Text(
                                categoryTabTitles[index].name,
                                style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: (TopTapsController.categoryTabIndex == index) ? redTextColor : blackTextColor,
                                ),
                              )
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  height: 115,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: subCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Center(
                          child: GestureDetector(
                              onTap: () {
                                TopTapsController.subCategoryTabIndex = index;
                                refresh();
                              },
                              child: Column(
                                children: [
                                  Image.network(
                                    DataBase.imgLink,
                                    width: 80,
                                    height: 80,
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
                                  const SizedBox(height: 5),
                                  Text(
                                    subCategories[index].name,
                                    style: TextStyle(
                                      fontFamily: 'Pacifico',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: (TopTapsController.subCategoryTabIndex == index) ? redTextColor : blackTextColor,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            myCategory.name,
                            style: const TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 18,
                                color: whiteTextColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                const Expanded(
                  child: Center(
                    child: Text(
                      "No Products",
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 16,
                        color: blackTextColor,
                      ),
                    )
                  ),
                ),
              ],
            );
          }
          else {
            //TODO here
            double currentScreenWidth = height / 2;
            double itemWidth = (currentScreenWidth - 40) / 3;
            return Column(
              children: [
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryTabTitles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        child: Center(
                          child: GestureDetector(
                              onTap: () {
                                TopTapsController.categoryTabIndex = index;
                                TopTapsController.subCategoryTabIndex = 0;
                                if (categoryTabTitles[index].id == -1) {
                                  onAllTabAction();
                                }
                                else {
                                  onCategoryTabAction(categoryTabTitles[index].id);
                                }
                              },
                              child: Text(
                                categoryTabTitles[index].name,
                                style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: (TopTapsController.categoryTabIndex == index) ? redTextColor : blackTextColor,
                                ),
                              )
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  height: 115,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: subCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Center(
                          child: GestureDetector(
                              onTap: () {
                                TopTapsController.subCategoryTabIndex = index;
                                refresh();
                              },
                              child: Column(
                                children: [
                                  Image.network(
                                    DataBase.imgLink,
                                    width: 80,
                                    height: 80,
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
                                  const SizedBox(height: 5),
                                  Text(
                                    subCategories[index].name,
                                    style: TextStyle(
                                      fontFamily: 'Pacifico',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: (TopTapsController.subCategoryTabIndex == index) ? redTextColor : blackTextColor,
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            myCategory.name,
                            style: const TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 18,
                                color: whiteTextColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                Expanded(
                  child: GridView.builder(
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
                              DataBase.imgLink,
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