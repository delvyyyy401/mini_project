import 'package:flutter/material.dart';
import '../constants.dart';
import '../data/inbox_data.dart';

class InboxScreen extends StatefulWidget {
  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: History()
  );
}

class History extends StatefulWidget {
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Widget> itemsData = [];

  void getPostsData(){
    List<dynamic> historyList = data;
    List<Widget> listItems = [];
    historyList.forEach((post) {
      listItems.add(Container(
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(radius: 30,
                      backgroundImage: AssetImage("assets/images/${post["image"]}"),
                    ),
                    // Image.asset(
                    //   "assets/images/${post["image"]}",
                    //   height: 80,
                    // ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["date"], textAlign: TextAlign.right,
                      style: const TextStyle(color: kTextColor, fontSize: 11),
                    ),
                    SizedBox(height: 10),
                    Text(
                      post["name"],
                      style: const TextStyle(fontWeight: FontWeight.bold, color: kTextColor, fontSize: 15),
                    ),
                    Text(
                      post["message"],
                      style: const TextStyle(color: kTextColor),
                    ),
                  ],
                ),
              ],
            ),
          )
      ));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.30;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("History"),
        backgroundColor: kBackgroundColor,
        foregroundColor: kTextColor,
        centerTitle: false,
      ),
      body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: itemsData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      return itemsData[index];
                    }),
              )
            ],
          )
      ),
    ));
  }
}
