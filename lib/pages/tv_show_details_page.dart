import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import '../components/episode_details_synopsis.dart';
import '../components/episode_info_details.dart';
import '../controllers/tv_show_details_controller.dart';
import '../utils/theme/colors.dart';

class TvShowDetailsPage extends GetView<TvShowDetailsController> {
  const TvShowDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: Get.size.height * .4,
                  width: double.infinity,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: controller.episode.image?.original ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: colorYellow,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),
                EpisodeInfoDetails(episode: controller.episode),
              ],
            ),
            EpisodeDetailsSynopsis(summary: controller.episode.summary ?? 'Not available'),
          ],
        ),
      ),
    );
  }
}
