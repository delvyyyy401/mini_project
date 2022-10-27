import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/page/detail.dart';
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

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  List<DetailData> data = DetailList;

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(vsync: this, length: 5);
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
              onPressed: (){
                showSearch(context: context, delegate: MySearchDelegate());
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                height: 175,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => buildCard(DetailList[index]),
                  separatorBuilder: (context, _) => SizedBox(width: 15),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    isScrollable: true,
                    controller: tabController,
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "For you"),
                      Tab(text: "Education"),
                      Tab(text: "Humanity"),
                      Tab(text: "Food"),
                      Tab(text: "Earth")
                    ],
                  ),
                ),
              ),
              Container(
                // width: double.maxFinite,
                height: 420,
                child: TabBarView(
                        controller: tabController,
                        children: [
                          ListView.builder(
                              itemCount: DetailList.length,
                              itemBuilder: (context, index){
                                DetailData detailData = DetailList[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(detailData.theme, style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 15)),
                                    subtitle: Text(detailData.desc),
                                    leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(detailData.image, height: 80)),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(detailData)));
                                    },
                                  ),
                                );
                              }
                          ),
                          ListView.builder(
                              itemCount: DetailList.where((element) => element.theme.contains("Education")).length,
                              itemBuilder: (context, index){
                                DetailData detailData = DetailList.where((element) => element.theme.contains("Education")).toList().elementAt(index);
                                return Card(
                                  child: ListTile(
                                    title: Text(detailData.theme, style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 15)),
                                    subtitle: Text(detailData.desc),
                                    leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(detailData.image, height: 80)),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(detailData)));
                                    },
                                  ),
                                );
                              }
                          ),
                          ListView.builder(
                              itemCount: DetailList.where((element) => element.theme.contains("Humanity")).length,
                              itemBuilder: (context, index){
                                DetailData detailData = DetailList.where((element) => element.theme.contains("Humanity")).toList().elementAt(index);
                                return Card(
                                  child: ListTile(
                                    title: Text(detailData.theme, style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 15)),
                                    subtitle: Text(detailData.desc),
                                    leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(detailData.image, height: 80)),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(detailData)));
                                    },
                                  ),
                                );
                              }
                          ),
                          ListView.builder(
                              itemCount: DetailList.where((element) => element.theme.contains("Food")).length,
                              itemBuilder: (context, index){
                                DetailData detailData = DetailList.where((element) => element.theme.contains("Food")).toList().elementAt(index);
                                return Card(
                                  child: ListTile(
                                    title: Text(detailData.theme, style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 15)),
                                    subtitle: Text(detailData.desc),
                                    leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(detailData.image, height: 80)),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(detailData)));
                                    },
                                  ),
                                );
                              }
                          ),
                          ListView.builder(
                              itemCount: DetailList.where((element) => element.theme.contains("Earth")).length,
                              itemBuilder: (context, index){
                                DetailData detailData = DetailList.where((element) => element.theme.contains("Earth")).toList().elementAt(index);
                                return Card(
                                  child: ListTile(
                                    title: Text(detailData.theme, style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 15)),
                                    subtitle: Text(detailData.desc),
                                    leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(detailData.image, height: 80)),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(detailData)));
                                    },
                                  ),
                                );
                              }
                          )
                        ],
                ),
              ),
            ],
          )
        ),
    )
    );
  }

  Widget buildCard(DetailData detailList) => Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
      ]),
    width: 300,
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              child: Ink.image(image: AssetImage(detailList.imageTop),
                fit: BoxFit.cover,
                child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(detailList))),
                ),
              )
          )),
        ),
        const SizedBox(height: 4),
        Text(detailList.theme, style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)),
        Text(detailList.desc),
      ],
    )
  );
}

class MySearchDelegate extends SearchDelegate{
  List<DetailData> searchResult = DetailList;

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: (){
        if(query.isEmpty){
          close(context, null);
        }else{
          query = '';
        }
      },
  )];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null)
  );

  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query,
      style: const TextStyle(fontSize: 64),
    ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<DetailData> suggestions = searchResult.where((searchResult) {
        final result= searchResult.theme.toLowerCase();
        final input = query.toLowerCase();

        return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
         final suggestion = suggestions[index];

         return ListTile(
           leading: Image.asset(suggestion.image),
           title: Text(suggestion.theme),
           subtitle: Text(suggestion.desc),
           onTap: (){
             query = suggestion.theme;
             Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(suggestion)));
           },
         );
        },
    );
  }
}


