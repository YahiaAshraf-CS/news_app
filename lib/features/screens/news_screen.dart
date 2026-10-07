import 'package:flutter/material.dart';
import 'package:news_app/features/widgets/news_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 23, 23),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title:  Text('Details News',style: TextStyle(color: Colors.white, fontSize: 25,shadows: [Shadow(color: Colors.black,offset: Offset(1,1))] ),),
        backgroundColor:  Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(16.0),
          child: NewsWidget(),
        ),
      ),
    );
  }
}

