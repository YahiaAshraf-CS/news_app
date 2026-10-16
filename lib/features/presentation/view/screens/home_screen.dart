import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_result.dart';
import 'package:news_app/features/data/api/app_api.dart';
import 'package:news_app/features/data/models/news_model.dart';
import 'package:news_app/features/presentation/view/widgets/home_container_widget.dart';
import 'package:news_app/features/presentation/view_model/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit homeCubit;

  @override
  initState() {
    super.initState();
    homeCubit = HomeCubit();
    homeCubit.getAllArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 23, 23),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            shadows: [Shadow(color: Colors.black, offset: Offset(1, 1))],
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                bloc: homeCubit,
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is HomeError) {
                    return Center(
                      child: Text(
                        homeCubit.errorMessage ?? 'An error occurred',
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  if (state is HomeSuccess) {
                    return ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            'news',
                            arguments: homeCubit.articles[index],
                          );
                        },
                        child: HomeContainerWidget(
                          articles: homeCubit.articles[index],
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 25),
                      itemCount: homeCubit.articles.length,
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
             
            ),
          ],
        ),
      ),
    );
  }
}
