import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_result.dart';
import 'package:news_app/data/api/app_api.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/features/widgets/home_container_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];
  bool isLoading = true;
  String? errorMessage;
  @override
  initState() {
    super.initState();
    getAllArticles();
  }
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
              child: isLoading ? const Center(child: CircularProgressIndicator()) : errorMessage != null ? Center(child: Text(errorMessage! ,style: TextStyle(color: Colors.red), textAlign: TextAlign.center)) : ListView.separated(
                itemBuilder: (context, index) => InkWell(
                   onTap: () {
                    Navigator.pushNamed(context, 'news',arguments: articles[index]);
                  
                   
                  },
                  child: HomeContainerWidget( articles: articles[index],
                  ),),
                separatorBuilder: (context, index) => const SizedBox(height: 25),
                itemCount: articles.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
  void getAllArticles() async {
    isLoading = true;
    var newsModel = await AppApi.getNews();
     switch (newsModel) {
      case ApiSuccess<dynamic>():
        articles = newsModel.data.articles ?? [];
   
      case ApiError():
        errorMessage = newsModel.message;
        
    }
    setState(() {
    
      isLoading = false;
    });
  }
}



  