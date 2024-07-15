import 'package:dating_app/pages/people/local_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'local_dependencies.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Favorites favorites = Provider.of<Favorites>(context);
    final Suggestion suggestion = Provider.of<Suggestion>(context, listen: false);

    final TextStyle textStyle = Theme.of(context).textTheme.displayMedium!.copyWith(
      color: Theme.of(context).colorScheme.onPrimary
    );

    return favorites.isNotEmpty
    ? Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ChaoticWrap<User>(
              rootModelItems: favorites.users,
              childProvider: (user) => 
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IntroCard(user),
                    ElevatedButton.icon(
                      icon: Icon(Icons.delete),
                      label: Text('Remove'),
                      onPressed: () {
                        favorites.removeUser(user);
                        if (user == suggestion.current) {
                          suggestion.toggleLike();
                        }
                      }
                    )
                  ]
                )
            )
          )
        ]
      )
    : Center(
        child: Text(
          'No favorites yet',
          style: textStyle
        )
      );
  }
}
