import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'suggestion.dart';
import '../favorites/favorites.dart';
import '../../widgets/intro_card.dart';

class PeoplePage extends StatefulWidget {
  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    final suggestion = Provider.of<Suggestion>(context);
    final Size totalSize = MediaQuery.of(context).size;
    Favorites fav = Provider.of<Favorites>(context);
    //Favorites fav = context.watch<Favorites>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: totalSize.width * 0.5),
            child: IntroCard(suggestion.current)
          ),
          SizedBox(height: totalSize.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  fav
                    .toggle(suggestion.current);

                  setState(() {
                    suggestion.current.isLiked = !suggestion.current.isLiked;
                  });
                },
                icon: Icon(
                  suggestion.current.isLiked
                  ? Icons.favorite
                  : Icons.favorite_border
                ),
                label: Text('Like')
              ),
              SizedBox(width: totalSize.width * 0.03),
              ElevatedButton(
                onPressed: suggestion.createNext,
                child: Text('Next'),
              ),
            ] ,
          ),
        ],
      ),
    );
  }
}