import 'package:flutter/material.dart';

class HomeContainerWidget extends StatelessWidget {
  const HomeContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            "https://static.vecteezy.com/system/resources/thumbnails/050/393/628/small/cute-curious-gray-and-white-kitten-in-a-long-shot-photo.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,//design
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return SizedBox(
                width: double.infinity,
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 13),
        const Text(
          'Cute Kitten',
          style: TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 197, 190, 190),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'This is a cute kitten looking at the camera with big round eyes.',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
