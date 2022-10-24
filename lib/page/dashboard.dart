import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../data/file_data.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: Dashboard()
  );
}

class  Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ContentCard contentCard = ContentCard();
  final CategoryList categoryList = CategoryList();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = content_data;
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

                    // categoryList,
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
                ),
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
              categoryList,
              Expanded(
                  child: ListView.builder(
                    controller: controller,
                    itemCount: itemsData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      return itemsData[index];
                    },
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class CategoryList extends StatefulWidget {
  const CategoryList();
  @override
  _CategoryListState createState() => _CategoryListState();
}
class _CategoryListState extends State<CategoryList> {
  // by default first item will be selected
  int selectedIndex = 0;
  List categories = ['For you', 'Education', 'Humanity', 'Food', 'Eart'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (

              ) {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: kDefaultPadding,
              // At end item it add extra 20 right  padding
              right: index == categories.length - 1 ? kDefaultPadding : 0,
            ),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? kPrimaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
                categories[index],
                style: index == selectedIndex
                    ? TextStyle(color: kTextLightColor)
                    : TextStyle(color: kTextShadow)
            ),
          ),
        ),
      ),
    );
  }
}
//
// class bottomNavigationBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: GNav(
//         backgroundColor: kBackgroundColor,
//         color: kTextColor,
//         activeColor: kPrimaryColor,
//         gap: 8,
//         // tabBackgroundColor: kPrimaryColor.withOpacity(0.6),
//         // padding: EdgeInsets.all(16),
//         onTabChange: (index){
//           print(index);
//         },
//         tabs: const[
//           GButton(icon: Icons.travel_explore, text: "Explore"),
//           GButton(icon: Icons.list_alt_outlined, text: "History"),
//           GButton(icon: Icons.mail, text: "Inbox"),
//           GButton(icon: Icons.person, text: "Profile"),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
