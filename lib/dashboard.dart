import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'file_data.dart';

class ContentScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Dashboard(),
      //bottomSheet: bottomNavigationBar(),
    );
  }
}
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ContentCard contentCard = ContentCard();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["theme"],
                      style: const TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: 15),
                    ),
                    Text(
                      post["desc"],
                      style: const TextStyle(color: kTextColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      post["time"],
                      style: const TextStyle(color: kTextColor),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/${post["image"]}",
                  height: double.infinity,
                )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      setState(() {
        closeTopContainer = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text("Dashboard"),
          backgroundColor: kBackgroundColor,
          foregroundColor: kTextColor,
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            ),
          ],
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Trending",
                    style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer?0:1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer?0:categoryHeight,
                    child: contentCard),
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index){
                        return itemsData[index];
                      },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// class ContentList extends StatefulWidget {
//   @override
//   _ContentList createState() => _ContentList();
// }
// class _ContentList extends State<ContentList> {
//   final ContentCard contentCard = ContentCard();
//   ScrollController controller = ScrollController();
//   bool closeTopContainer = false;
//   double topContainer = 0;
//   List<Widget> itemsData = [];
//
//   void getPostsData() {
//     List<dynamic> responseList = FOOD_DATA;
//     List<Widget> listItems = [];
//     responseList.forEach((post) {
//       listItems.add(Container(
//           height: 150,
//           margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
//             BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
//           ]),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       post["theme"],
//                       style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       post["desc"],
//                       style: const TextStyle(fontSize: 17, color: Colors.grey),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       post["time"],
//                       style: const TextStyle(fontSize: 17, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//                 Image.asset(
//                   "assets/images/${post["image"]}",
//                   height: double.infinity,
//                 )
//               ],
//             ),
//           )));
//     });
//     setState(() {
//       itemsData = listItems;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getPostsData();
//     controller.addListener(() {
//       setState(() {
//         closeTopContainer = false;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     final double categoryHeight = size.height*0.30;
//     return SafeArea(child: Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             AnimatedOpacity(
//               duration: const Duration(milliseconds: 200),
//               opacity: closeTopContainer?0:6,
//               child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 200),
//                   width: size.width,
//                   alignment: Alignment.topCenter,
//                   height: closeTopContainer?0:categoryHeight,
//                   child: contentCard
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
//
// }

class ContentCard extends StatelessWidget {
  const ContentCard();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 20),
                height: 190,
                width: 350,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20.0)), boxShadow: [kDefaultShadow]),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/TopContent1.jpg"),
                            )
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Education",
                        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Let’s help the palestian for better education",
                        style: TextStyle(color: kTextColor),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                height: 190,
                width: 350,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20.0)), boxShadow: [kDefaultShadow]),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/TopContent2.jpg"),
                            )
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Earth",
                        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Let's help Indonesia's forests become green forests",
                        style: TextStyle(color: kTextColor),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                height: 190,
                width: 350,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20.0)), boxShadow: [kDefaultShadow]),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/TopContent3.jpg"),
                            )
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Food",
                        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Let's help Palestinians for proper food",
                        style: TextStyle(color: kTextColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
