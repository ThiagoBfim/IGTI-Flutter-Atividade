import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          _buildCard(title: "IMC", asset: "imc", route: "/imc"),
          _buildCard(title: "TODO", asset: "todo", route: "/todo"),
          _buildCard(title: "CHAT", asset: "chat", route: "/chat"),
        ],
      ),
    );
  }

  _sendToPage(String route) {
    Modular.to.pushNamed(route);
  }

  Widget _buildCard(
      {required String title, required String asset, required String route}) {
    return GestureDetector(
      onTap: () => _sendToPage(route),
      child: Hero(
        tag: Key(asset),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/$asset.png",
                height: 100,
                width: 100,
              ),
              Text(
                "$title",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
