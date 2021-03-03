import 'dart:convert';

import 'package:flutter_api_integration/Constants/Strings.dart';
import 'package:flutter_api_integration/ModelClass/NewsModel.dart';
import 'package:http/http.dart' as http;
class ApiManager{
  Future<Welcome> getNews() async{
    var client= http.Client();
    var newsModel=null;
    try{
      var response= await  client.get(Strings.newsUrl);
      if(response.statusCode==200){
        var jsonString= response.body;
        var jsonMap= json.decode(jsonString);
        newsModel=Welcome.fromJson(jsonMap);
      }
    }catch(e){
      return newsModel;
    }

    return newsModel;
  }
}