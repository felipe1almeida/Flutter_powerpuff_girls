import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/tv_show_episodes_model.dart';
import '../utils/functions/shared_function.dart';
import '../utils/theme/colors.dart';

class EpisodesList extends StatelessWidget {
  final TvShowEpisodesModel episode;

  const EpisodesList({
    Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ListTile(
            title: RichText(
              text: TextSpan(
                text: 'S${episode.season} '
                    'E${episode.number}: ',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: colorYellow,
                ),
                children: [
                  TextSpan(
                    text: episode.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: colorPrimary,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              formatDate(
                date: episode.airdate.toString(),
                format: 'MMM d, y',
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: colorPrimary,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: colorPrimary),
            onTap: () => Get.toNamed(
              '/details',
              arguments: episode,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Divider(
              color: colorDividerList,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
