import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/res/app_urls/app_urls.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/view/home_screens/search_screen/search_widgets.dart';

import 'search_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final String apiUrl =
      'http://54.173.21.116:8000/api/v1/acadmies/documents/'; // Replace with your API URL
  final String authToken = 'fd0adfe9f9c26869c3e21e5810f3afbaa6540248';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final provider = Provider.of<SearchProvider>(context, listen: false);
    provider.getModel(
        loginDetails: null,
        url: '${AppUrls.baseUrl}${AppUrls.carModel}',
        context: context);
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
          Consumer<SearchProvider>(
            builder: (context, value, child) => value.loading
                ? SizedBox(
                    height: height * 0.4,
                    child: Center(
                        child: CircularProgressIndicator(
                            color: AppColors.buttonColor)),
                  )
                : Column(
                    children: [
                      ...List.generate(value.abc.length, (mainIndex) {
                        value.searchTitles();
                        return value.ab.toString().toLowerCase().contains(
                                value.abc[mainIndex].toString().toLowerCase())
                            ? LayoutBuilder(
                                builder: (context, constraints) =>
                                    ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxHeight: constraints.maxHeight),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.03,
                                            vertical: height * 0.01),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            value.abc[mainIndex],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2,
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                                        itemCount: value.carModel.model!.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return value
                                                  .carModel.model![index].model
                                                  .toString()
                                                  .toLowerCase()
                                                  .startsWith(value
                                                      .abc[mainIndex]
                                                      .toString()
                                                      .toLowerCase())
                                              ? searchWidget(
                                                  width: width,
                                                  height: height,
                                                  modelName: value.carModel
                                                      .model![index].model
                                                      .toString(),
                                                  number: value
                                                      .carModel.model![index].id
                                                      .toString(),
                                                  context: context,
                                                  onTap: () {
                                                    value
                                                        .navigateToFilterScreen(
                                                            model: value
                                                                .carModel
                                                                .model![index]
                                                                .model
                                                                .toString(),
                                                            context: context,
                                                            title: value
                                                                .carModel
                                                                .model![index]
                                                                .model
                                                                .toString());
                                                  })
                                              : SizedBox.shrink();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox.shrink();
                      }),
                    ],
                  ),
          )
        ]),
      ),
    ));
  }
}
