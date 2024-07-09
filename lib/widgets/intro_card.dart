import 'package:flutter/material.dart';
import '../profile/models/user.dart';

class IntroCard extends StatelessWidget {
  final User user;

  const IntroCard(this.user, {super.key});

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
          mainAxisSize: MainAxisSize.min,
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
                  image: NetworkImage(user.picture.url)
                )
              )
            ),
            Text(
              user.description,
              style: textStyle
            ),
          ],
        ),
      )
    );
  }
}