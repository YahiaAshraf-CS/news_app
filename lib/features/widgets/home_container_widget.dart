import 'package:flutter/material.dart';
import 'package:news_app/data/models/news_model.dart';

class HomeContainerWidget extends StatelessWidget {
  const HomeContainerWidget({super.key, required this.articles});

  final Article articles;

  @override
  Widget build(BuildContext context) {
    var imageUrl = articles.urlToImage ?? 'https://static.vecteezy.com/system/resources/thumbnails/050/393/628/small/cute-curious-gray-and-white-kitten-in-a-long-shot-photo.jpg';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200, 
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
        Text(
          articles.author ?? 'No Author',
          style: const TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 197, 190, 190),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          articles.title ?? 'No title',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
