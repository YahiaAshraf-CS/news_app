import 'package:flutter/material.dart';
import 'package:news_app/features/widgets/home_container_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 23, 23),
      appBar: AppBar(
        centerTitle: true,
        title:  Text('News App',style: TextStyle(color: Colors.white, fontSize: 25,shadows: [Shadow(color: Colors.black,offset: Offset(1,1))] ),),
        backgroundColor:  Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                   onTap: () {
                  
                    Navigator.pushNamed(context, 'news');
                  },
                  child: HomeContainerWidget()),
                separatorBuilder: (context, index) => const SizedBox(height: 25),
                itemCount: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



  