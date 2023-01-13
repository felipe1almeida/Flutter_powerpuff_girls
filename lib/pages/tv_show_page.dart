import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:styled_text/styled_text.dart';
import 'package:transparent_image/transparent_image.dart';

import '../components/episodes_list.dart';
import '../components/error_loading_page.dart';
import '../controllers/tv_show_controller.dart';
import '../utils/theme/colors.dart';
import '../utils/theme/styled_text.dart';

class TvShowPage extends GetView<TvShowController> {
  const TvShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          bottom: false,
          child: FutureBuilder(
            future: controller.getTvShow(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: snapshot.data!.image?.original ?? '',
                                width: Get.size.width * 0.30,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            snapshot.data!.name ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              letterSpacing: 2.0,
                              color: colorYellow,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            // height: Get.size.height * .12,
                            child: SingleChildScrollView(
                              child: StyledText(
                                text: snapshot.data!.summary ?? 'Not available',
                                tags: styledTags,
                                style: const TextStyle(
                                  color: colorSecondary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              style: const TextStyle(color: colorPrimary),
                              controller.formatShowInfo(
                                premiere: snapshot.data!.premiered ?? 'N/A',
                                ended: snapshot.data!.ended ?? 'N/A',
                                status: snapshot.data!.status ?? 'N/A',
                                rating: snapshot.data!.rating?.average ?? 0.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: const [
                          Icon(Icons.local_activity, color: colorYellow),
                          SizedBox(width: 8),
                          Text(
                            'All Episodes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: colorYellow,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: colorYellow),
                    Expanded(
                      child: Container(
                        color: colorBackgroundSecondary,
                        child: Obx(
                          () => ListView.builder(
                            itemCount: controller.episodes.length,
                            itemBuilder: (context, index) {
                              return EpisodesList(
                                episode: controller.episodes[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return ErrorLoadingPage(onPressed: () => controller.getTvShow());
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
