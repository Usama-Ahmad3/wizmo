import 'package:flutter/material.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/view/home_screens/search_screen/search_widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late int modelIndex;
  @override
  void initState() {
    print('In the Search Screen');
    modelIndex = models.length;
    print(modelIndex);
    super.initState();
  }

  final String apiUrl =
      'http://54.173.21.116:8000/api/v1/acadmies/documents/'; // Replace with your API URL
  final String authToken = 'fd0adfe9f9c26869c3e21e5810f3afbaa6540248';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: AppColors.transparent,
            height: height * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Filter Search',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: AppColors.black)),
              ],
            ),
          ),
          ...List.generate(abc.length, (mainIndex) {
            return LayoutBuilder(
              builder: (context, constraints) => ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03, vertical: height * 0.01),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          abc[mainIndex],
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: models.length,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return models[index]
                                .toString()
                                .toLowerCase()
                                .startsWith(
                                    abc[mainIndex].toString().toLowerCase())
                            ? modelList(width, height, models[index],
                                abc[mainIndex], '301', context)
                            : const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
          // ...List.generate(models.length, (index) {
          //   return models[index]
          //           .toString()
          //           .toLowerCase()
          //           .startsWith('a'.toLowerCase())
          //       ? modelList(
          //           width, height, models[index], "A, a", '301', context)
          //       : const SizedBox.shrink();
          // }),
          // ...List.generate(models.length, (index) {
          //   return models[index]
          //           .toString()
          //           .toLowerCase()
          //           .startsWith('b'.toLowerCase())
          //       ? modelList(
          //           width, height, models[index], "B, b", '303', context)
          //       : const SizedBox.shrink();
          // }),
          // ...List.generate(models.length, (index) {
          //   return models[index]
          //           .toString()
          //           .toLowerCase()
          //           .startsWith('c'.toLowerCase())
          //       ? modelList(
          //           width, height, models[index], "C, c", '303', context)
          //       : const SizedBox.shrink();
          // }),
        ]),
      ),
    ));
  }

  List models = ['car', 'boo', 'model', 'a5', 'w2', 'e4', 'a6', 'h6', 'high'];
  List abc = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'x',
    'y',
    'z'
  ];
}
