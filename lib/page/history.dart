import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/history_data.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
        ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/${post["image"]}",
                        height: 80,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["date"],
                      style: const TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: 15),
                    ),
                    Text(
                      post["desc"],
                      style: const TextStyle(color: kTextColor),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Amount Donated : \$${post["donate"]}",
                      style: const TextStyle(color: kTextShadow, fontSize: 10),
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
