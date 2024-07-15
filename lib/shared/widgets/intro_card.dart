import 'package:flutter/material.dart';
import '../models/profile.dart';

class IntroCard<TProfile extends Profile> extends StatelessWidget {
  final TProfile profile;

  const IntroCard(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData mainTheme = Theme.of(context);
    final TextStyle textStyle = mainTheme.textTheme.bodyLarge!.copyWith(
      color: mainTheme.colorScheme.onPrimary);
    final Size totalSize = MediaQuery.of(context).size;
    
    return Card(
      color: mainTheme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: totalSize.width * 0.2,
                maxHeight: totalSize.height * 0.2
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.scaleDown,
                  image: NetworkImage(profile.picture.url)
                )
              )
            ),
            Text(
              profile.description,
              style: textStyle
            ),
          ],
        ),
      )
    );
  }
}