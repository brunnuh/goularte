import 'package:flutter/material.dart';

import 'components/field_ideas_card.dart';
import 'components/top_ideas.dart';

class IdeasView extends StatelessWidget {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: ListView(
          physics: ScrollPhysics(),
          children: [
            TopIdeas(),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Outras Ideias ...',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (_, __) {
                return FieldIdeasCard();
              },
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
