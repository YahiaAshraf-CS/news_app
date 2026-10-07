import 'package:flutter/material.dart';
class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

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
            height: 250,
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
        SizedBox(height: 13),
        Text(
          'This is a cute kitten looking at the camera with big round eyes.',
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            shadows: [
              Shadow(
                color: const Color.fromARGB(255, 145, 112, 112),
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),

        Text(
          'Cute Kitten',
          style: TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 197, 190, 190),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'This is a cute kitten looking at the camera with big round eyes. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}

