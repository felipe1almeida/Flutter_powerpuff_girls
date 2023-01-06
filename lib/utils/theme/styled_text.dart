import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

import 'colors.dart';

Map<String, StyledTextTagBase>? styledTags = {
  'b': StyledTextTag(
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      color: colorYellow,
    ),
  ),
};
