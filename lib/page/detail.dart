import 'package:flutter/material.dart';
import '../constants.dart';

class DetailContent extends StatefulWidget {
  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: ContentCard(),
      //bottomSheet: bottomNavigationBar(),
    );
  }

  buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kBackgroundColor,
      foregroundColor: kTextColor,
      centerTitle: false,
    );
  }
}

// class Detail extends StatefulWidget {
//   @override
//   State<Detail> createState() => _DetailState();
// }

// class _DetailState extends State<Detail> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
// }
//
class ContentCard extends StatefulWidget {
  const ContentCard();

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
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
                height: 200,
                width: 400,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 350,
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
            ],
          ),
        ),
      ),
    );
  }
}

