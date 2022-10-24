import 'package:flutter/material.dart';
import 'package:mini_project/page/login_registration.dart';

import '../constants.dart';
import '../data/profile_data.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: Profile()
  );
}

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Widget> itemsData = [];

  void getPostsData(){
    List<dynamic> historyList = data;
    List<Widget> listItems = [];
    historyList.forEach((post) {
      listItems.add(
          Container(
          height: 260,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
          //   BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          // ]),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(radius: 45,
                      backgroundImage: AssetImage("assets/images/${post["image"]}"),
                    ),
                    // Image.asset(
                    //   "assets/images/${post["image"]}",
                    //   height: 90,
                    // ),
                    SizedBox(height: 10),
                    Text(
                      post["name"],
                      style: const TextStyle(color: kTextColor, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      post["username"],
                      style: const TextStyle(color: kTextShadow, fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      //alignment: WrapAlignment.spaceAround,
                      spacing: 75,
                      children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "${post["subscribe"]}",
                              style: const TextStyle(color: kTextColor, fontWeight: FontWeight.bold, fontSize: 18)
                          ),
                          Text("Subscribed", style: const TextStyle(color: kTextShadow)),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${post["followers"]}",
                              style: const TextStyle(color: kTextColor, fontWeight: FontWeight.bold, fontSize: 18)
                          ),
                          Text("Followers", style: const TextStyle(color: kTextShadow)),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${post["following"]}",
                              style: const TextStyle(color: kTextColor, fontWeight: FontWeight.bold, fontSize: 18)
                          ),
                          Text("Following", style: const TextStyle(color: kTextShadow)),
                        ],
                      ),
                    ],
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
        title: Text("Profile"),
        backgroundColor: kBackgroundColor,
        foregroundColor: kTextColor,
        centerTitle: false,
      ),
      body: Container(
          alignment: Alignment.centerLeft,
          height: size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: itemsData.length,
                    itemBuilder: (context, index){
                      return itemsData[index];
                    }),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
                  BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 5.0),
                ]),
                child: TextButton(onPressed: (){},
                    child: Text("My Account", style: TextStyle(color: kTextColor)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 162, vertical: 26)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                            )
                        )
                    )
                ),
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
                  BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 5.0),
                ]),
                child: TextButton(onPressed: (){},
                    child: Text("My Wallet", style: TextStyle(color: kTextColor)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 162, vertical: 26)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        )
                    )
                ),
              ),

              Container(
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
                  BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 5.0),
                ]),
                child: TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));},
                    child: Text("Log Out", style: TextStyle(color: kTextColor)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 162, vertical: 26)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        )
                    )
                ),
              ),
              Container(
                height: 120,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
                //   BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
                // ]),
              ),
            ],
          )
      ),
    ));
  }
}

