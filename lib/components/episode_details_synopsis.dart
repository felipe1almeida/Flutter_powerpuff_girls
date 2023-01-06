import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

import '../utils/theme/colors.dart';
import '../utils/theme/styled_text.dart';

class EpisodeDetailsSynopsis extends StatelessWidget {
  final String summary;

  const EpisodeDetailsSynopsis({
    Key? key,
    required this.summary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Synopsis',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colorPrimary,
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              child: StyledText(
                text: summary,
                tags: styledTags,
                style: const TextStyle(
                  color: colorSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
