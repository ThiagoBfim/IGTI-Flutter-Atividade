import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  final String title;
  const ImcPage({Key? key, this.title = 'ImcPage'}) : super(key: key);
  @override
  ImcPageState createState() => ImcPageState();
}
class ImcPageState extends State<ImcPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}