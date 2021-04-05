import 'package:flutter/material.dart';
import 'package:goularte/views/ideas/components/card_ideas.dart';

class TopIdeas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Top Ideias',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 140,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CardIdeas(
                position: 1,
              ),
              CardIdeas(
                position: 2,
              ),
              CardIdeas(
                position: 3,
              ),
            ],
          ),
        )
      ],
    );
  }
}
