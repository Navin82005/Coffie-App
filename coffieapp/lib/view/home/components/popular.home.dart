import 'dart:ui';

import 'package:coffieapp/controller/popular.contoller.dart';
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
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: controller.popularData.length,
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
        Text(
          controller.popularData[index].name,
          style: const TextStyle(
            fontFamily: "Inter",
            fontSize: 18,
            color: Color(0xFFCDCDCD),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                Text(
                  controller.popularData[index].oneLiner,
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontSize: 10,
                    color: Color(0xFF303030),
                  ),
                ),
                const SizedBox(height: 6),
                RatingWidget(
                  rating: controller.popularData[index].rating,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ],
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: const Color(0xFF66A35C),
                borderRadius: BorderRadius.circular(2),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            )
          ],
        )
      ];
}
