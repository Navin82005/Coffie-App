import 'dart:ui';

import 'package:coffieapp/controller/popular.contoller.dart';
import 'package:coffieapp/core/conf/app_config.dart';
import 'package:coffieapp/view/common/adder.dart';
import 'package:coffieapp/view/common/glass_morphic_container.common.dart';
import 'package:coffieapp/view/common/rating_widget.common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularSection extends StatefulWidget {
  const PopularSection({super.key});

  @override
  State<PopularSection> createState() => _PopularSectionState();
}

class _PopularSectionState extends State<PopularSection> {
  var popularController = Get.put(PopularController());

  @override
  void initState() {
    super.initState();
    popularController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0x31313173),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: GetX<PopularController>(builder: (controller) {
          return ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: controller.popularData.length,

            //
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GlassMorphicContainer(
                  borderRadius: 5,
                  imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  height: 270,
                  width: 220,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.popularData[index].imagePath != "")
                            Center(
                              child: Image.asset(
                                controller.popularData[index].imagePath,
                                height: 125,
                                width: 125,
                              ),
                            )
                          else
                            const Center(
                              child: SizedBox(
                                height: 125,
                                width: 125,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                            ),
                          if (!controller.isLoading.value)
                            ...renderContent(controller, index)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  renderContent(controller, index) => [
        AppTypography.Heading1(
          text: controller.popularData[index].name,
          fontWeight: FontWeight.w500,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                AppTypography.body2(
                  text: controller.popularData[index].name,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 6),
                RatingWidget(
                  rating: controller.popularData[index].rating,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ],
            ),
            const Adder(),
          ],
        )
      ];
}
