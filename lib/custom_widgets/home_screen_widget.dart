import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/custom_widgets/web_mobile_size.dart';
import 'package:shopping/main_navigator_controller.dart';

import '../data/Category.dart';
import '../data/DataBase.dart';
import '../screens/category_screen.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key, required this.onNavigateAction});

  final Function onNavigateAction;

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState(onNavigateAction: onNavigateAction);
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  _HomeScreenWidgetState({required this.onNavigateAction});

  final Function onNavigateAction;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    const int len = 4;
    final List<String> tabTitles = ['Tab 1', 'Tab 2', 'Tab 3'];

    return StreamBuilder<List<Category>>(
      stream: Stream.fromIterable([DataBase.categories]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          double currentScreenWidth = height / 2;
          double itemWidth = (currentScreenWidth - 40) / 3;
          return Column(
            children: [
              // const DefaultTabController(
              //   length: tabTitles.length,
              //   child: TabBar(
              //     tabs: [
              //       Text("data"),
              //       Text("data"),
              //       Text("data"),
              //       Text("data"),
              //     ],
              //   ),
              // ),
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
                      onNavigateAction(snapshot.data?[index].id);
                      // Navigator.pushNamed(context, CategoryScreen.id, arguments: snapshot.data?[index].id);
                    },
                    child: Container(
                      // color: Colors.red,
                      child: Column(
                        children: [
                          ClipOval(
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