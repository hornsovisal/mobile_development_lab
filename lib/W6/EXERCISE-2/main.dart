import 'package:flutter/material.dart';
import 'package:mobile_development_lab/W6/EXERCISE-2/data/profile_data.dart';

import 'ui/screens/profile.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileApp(profileData: ronanProfile),
    ),
  );
}
