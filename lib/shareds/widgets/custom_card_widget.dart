import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final int? numberOfCards;
  final Color? color;
  final String? imageURL;

  const CustomCardWidget({
    Key? key,
    required this.numberOfCards,
    required this.imageURL,
    this.color = Colors.amber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int lengthCardUnwrapped = numberOfCards ?? 0;
    String imageURLUnwrapped = imageURL ?? '';

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: lengthCardUnwrapped,
      ),
      itemCount: lengthCardUnwrapped,
      itemBuilder: (BuildContext? context, int? count) {
        return Card(
          borderOnForeground: true,
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Image.network(imageURLUnwrapped)),
            ],
          ),
          elevation: 4,
        );
      },
    );
  }
}
