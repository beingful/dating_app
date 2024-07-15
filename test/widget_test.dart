import 'package:dating_app/database/repositories/repository.dart';
import 'package:dating_app/pages/people/people_page.dart';
import 'package:dating_app/shared/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'mocks/dating_app.mocks.dart';
import 'mocks/widget_test.mocks.dart';

@GenerateMocks([Repository<User>])
void main() {
  final MockRepository<User> repository = MockRepository<User>();
  final MockDatingApp app = MockDatingApp(repository);

  setUpAll(() async {
    when(repository.set(any, any))
      .thenAnswer((_) async {});
  });

  testWidgets('Like button icon change on tap test',
  (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(app);
    });

    final Finder buttonWithFavoriteBorderIcon = find.descendant(
      of: find.byType(PeoplePage),
      matching: find.byIcon(Icons.favorite_border),
    );

    await tester.pumpAndSettle();

    await tester.tap(buttonWithFavoriteBorderIcon);

    final Finder buttonWithFavoriteIcon = find.descendant(
      of: find.byType(PeoplePage),
      matching: find.byIcon(Icons.favorite),
    );

    await tester.pumpAndSettle();
    
    expect(buttonWithFavoriteIcon, findsOne);
    expect(buttonWithFavoriteBorderIcon, findsNothing);
  });
}
