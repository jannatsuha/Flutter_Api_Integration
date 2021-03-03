import 'package:flutter/material.dart';
import 'package:flutter_api_integration/Pages/DetailsPage.dart';
import 'package:intl/intl.dart';
import 'package:flutter_api_integration/ModelClass/NewsModel.dart';
import 'package:flutter_api_integration/Services/ApiManager.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future <Welcome>_newsModel;
  @override
  void initState() {
    _newsModel=ApiManager().getNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API INTEGRATION"),
      ),
      body: Container(
        child: FutureBuilder<Welcome>(
          future: _newsModel,
          builder: (context,snapshot){
            if(snapshot.hasData){
              return  ListView.builder(
                itemCount: snapshot.data.articles.length,
                  itemBuilder:
                  (context,index){
                  var article= snapshot.data.articles[index];
                  var formattedTime = DateFormat('dd MMM - HH:mm')
                      .format(article.publishedAt);
                  return InkWell(
                    onTap: (){
                      var route=MaterialPageRoute
                        (builder: (BuildContext context)=>
                          DetailsPage(value: Article(
                            description: article.description,
                          ) ),
                      );
                      Navigator.of(context).push(route);
                    },
                    child: Container(
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                article.urlToImage,
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(formattedTime),
                              Text(
                                article.title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                article.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ),
                  );
              });
            }
            else{
              return Center(child: CircularProgressIndicator());
            }

          },

        ),
      ),
    );
  }
}
