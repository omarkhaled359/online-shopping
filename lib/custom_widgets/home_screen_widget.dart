import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/custom_widgets/web_mobile_size.dart';
import 'package:shopping/main_navigator_controller.dart';

import '../data/Category.dart';
import '../data/DataBase.dart';
import '../screens/category_screen.dart';
import '../top_taps_controller.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key, required this.onNavigateAction});

  final Function onNavigateAction;

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState(onNavigateAction: onNavigateAction);
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  _HomeScreenWidgetState({required this.onNavigateAction});

  final Function onNavigateAction;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    TopTapsController.categoryTabIndex = 0;
    TopTapsController.subCategoryTabIndex = 0;
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

    return StreamBuilder<List<Category>>(
      stream: Stream.fromIterable([DataBase.categories]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          double currentScreenWidth = height / 2;
          double itemWidth = (currentScreenWidth - 40) / 3;
          return Column(
            children: [
              SizedBox(
                height: 30,
                child: ListView.builder(
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
                              if (categoryTabTitles[index].id != -1) {
                                onNavigateAction(categoryTabTitles[index].id);
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

              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 0.77
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      TopTapsController.categoryTabIndex = index + 1;
                      TopTapsController.subCategoryTabIndex = 0;
                      onNavigateAction(snapshot.data?[index].id);
                    },
                    child: Container(
                      // color: Colors.red,
                      child: Column(
                        children: [
                          ClipOval(
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