import 'package:aimuse/core/config/design_config.dart';
import 'package:flutter/material.dart';

class SlideshowWidget extends StatelessWidget {
  final List<String> images;
  final int currentIndex;
  final String slideTitle;
  final ValueChanged<int> onPageChanged;

  const SlideshowWidget({
    super.key,
    required this.images,
    required this.currentIndex,
    required this.onPageChanged,
    required this.slideTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            itemCount: images.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12),
                    ),
                    child: Image.network(images[index], fit: BoxFit.cover),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            slideTitle,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: DesignConfig.slideshowTextColor,
                              fontSize: 18,

                              // shadows: [
                              //   Shadow(
                              //     blurRadius: 4,
                              //     color: Colors.black54,
                              //     offset: Offset(1, 1),
                              //   ),
                              // ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            images.length,
                            (i) => Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    currentIndex == i
                                        ? DesignConfig
                                            .slideshowCurrentIndexColor
                                        : DesignConfig.slideshowIndexColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
