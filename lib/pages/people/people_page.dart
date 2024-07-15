import 'package:dating_app/database/repositories/repository.dart';
import 'package:dating_app/shared/widgets/distance_map.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'local_dependencies.dart';

class PeoplePage extends StatefulWidget {
  final Repository<User> repository;

  PeoplePage(this.repository);

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    final Suggestion suggestion = Provider.of<Suggestion>(context);
    final Geolocation geolocation = Provider.of<Geolocation>(context);

    final Size totalSize = MediaQuery.of(context).size;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: totalSize.width * 0.4
                ),
                child: IntroCard(suggestion.current)
              ),
              SizedBox(height: totalSize.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (suggestion.current.isLiked) {
                        widget.repository.remove(suggestion.current.id);
                      } else {
                        widget.repository.set(suggestion.current, UserConverter());
                      }

                      suggestion.toggleLike();
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
              )
            ],
          ),
          if (geolocation.current != null && suggestion.current.location != null)
            DistanceMap(
              totalSize.width * 0.3,
              totalSize.height * 0.5,
              EdgeInsets.only(left: totalSize.width * 0.03)
            )
        ],
      )
    );
  }
}