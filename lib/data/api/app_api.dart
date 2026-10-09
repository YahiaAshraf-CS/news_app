import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/network/api_result.dart';
import 'package:news_app/data/models/news_model.dart';

abstract class AppApi {
  static Future<ApiResult<dynamic>> getNews() async {
    try{
var response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=eb5e3f77b0514b3e824935e6ecfd12d2',
      ),
    );
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    NewsModel newsModel = NewsModel.fromJson(json);
    if (response.statusCode >=200 && response.statusCode < 300) {
      return ApiSuccess(newsModel);
    } else {
      return ApiError(json['message'] ?? 'Something went wrong');
    
    }
    
    } catch (e) {
      return ApiError(e.toString());
    }
    // https://newsapi.org/v2/everything?q=bitcoin&apiKey=eb5e3f77b0514b3e824935e6ecfd12d2
    
  }
}
