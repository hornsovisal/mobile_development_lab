import 'package:flutter/material.dart';
import 'package:mobile_development_lab/W6/EXERCISE-2/model/profile_tile_model.dart';

import '../theme/theme.dart';

class ProfileApp extends StatelessWidget {
  final ProfileData profileData;

  const ProfileApp({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withAlpha(100),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Center(
          child: Text("Student Profile", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(profileData.avatarUrl),
            ),
            Text(
              profileData.name,
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            Text(
              profileData.position,
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),

            SizedBox(height: 50),

            ...profileData.tiles.map((td) => ProfileTile(titleData: td)),

            // for (TileData td in profileData.tiles) ProfileTile(titleData: td),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key, required this.titleData});

  final TileData titleData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(titleData.icon, color: AppColors.primary),
          title: Text(titleData.title),
          subtitle: Text(titleData.value),
        ),
      ),
    );
  }
}
