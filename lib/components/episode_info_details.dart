import 'package:flutter/material.dart';

import '../models/tv_show_episodes_model.dart';
import '../utils/functions/shared_function.dart';
import '../utils/theme/colors.dart';

class EpisodeInfoDetails extends StatelessWidget {
  final TvShowEpisodesModel episode;

  const EpisodeInfoDetails({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 90,
          decoration: const BoxDecoration(color: Colors.black54),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'S${episode.season} '
                  'E${episode.number}: '
                  '${episode.name}',
                  style: const TextStyle(
                    color: colorYellow,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      formatDate(date: episode.airdate ?? '', format: 'MMM dd, yyyy'),
                      style: const TextStyle(
                        color: colorPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Icon(Icons.access_time_rounded, color: colorPrimary, size: 14),
                    const SizedBox(width: 5),
                    Text(
                      '${episode.runtime?.toString() ?? ''} minutes',
                      style: const TextStyle(
                        color: colorPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
