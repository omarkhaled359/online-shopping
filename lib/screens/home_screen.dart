import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/data/Category.dart';
import 'package:shopping/data/DataBase.dart';
import 'package:shopping/screens/category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _HomeScreenState();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = 0.0;
    if (width > height) padding = width / 2 - height / 4;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Scaffold(
        backgroundColor: kMainColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          title: const Center(child: Text('WELCOME !')),
        ),
        body: StreamBuilder<List<Category>>(
          stream: Stream.fromIterable([DataBase.categories]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              double currentScreenWidth = height / 2;
              double itemWidth = (currentScreenWidth - 40) / 3;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.77
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CategoryScreen.id, arguments: snapshot.data?[index].id);
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
        ),
      ),
    );
  }
}