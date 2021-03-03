import 'package:flutter/material.dart';
import 'package:flutter_api_integration/ModelClass/NewsModel.dart';
class DetailsPage extends StatefulWidget {
   Article value;
  DetailsPage({Key key,this.value}):super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('${widget.value.description}',style: TextStyle(
            fontSize: 20
          ),),
        ),
      ),
    );
  }
}
