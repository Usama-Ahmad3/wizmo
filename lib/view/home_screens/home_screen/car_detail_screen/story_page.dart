import 'package:flutter/material.dart';
import 'package:story/story.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/cashed_image.dart';

class StoryPage extends StatelessWidget {
  final List<dynamic> files;

  const StoryPage({Key? key, required this.files}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          Navigator.of(context).pop();
        },
        child: StoryPageView(
          itemBuilder: (context, pageIndex, storyIndex) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Container(color: AppColors.black),
                ),
                Positioned.fill(
                  child: cachedNetworkImage(
                    imageFit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width,
                    cuisineImageUrl: files[storyIndex] ?? "",
                  ),
                ),
              ],
            );
          },
          gestureItemBuilder: (context, pageIndex, storyIndex) {
            return Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
          pageLength: 1,
          storyLength: (int pageIndex) {
            return files.length;
          },
          onPageLimitReached: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
