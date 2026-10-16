import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/network/api_result.dart';
import 'package:news_app/features/data/api/app_api.dart';
import 'package:news_app/features/data/models/news_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Article> articles = [];
  bool isLoading = true;
  String? errorMessage;
  void getAllArticles() async {
    emit(HomeLoading());

    var newsModel = await AppApi.getNews();
    switch (newsModel) {
      case ApiSuccess<dynamic>():
        articles = newsModel.data.articles ?? [];
        emit(HomeSuccess());

      case ApiError():
        errorMessage = newsModel.message;
        emit(HomeError());
    }

  }
}
