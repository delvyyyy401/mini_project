import 'dart:io';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/file_data.dart';

class DetailPage extends StatefulWidget {
  final DetailData detailData;
  DetailPage(this.detailData);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Donate Now!"),
        backgroundColor: kBackgroundColor,
        foregroundColor: kTextColor,
        centerTitle: false,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Container(
            // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
            //       BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            //     ]),
            margin: EdgeInsets.all(10),
            height: 710,
            width: 380,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 130,
                      width: 370,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Material(
                              child: Ink.image(image: AssetImage(widget.detailData.imageTop),
                                height: 120,
                                fit: BoxFit.cover,
                              )
                          )),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.detailData.theme,
                      style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      widget.detailData.desc,
                      style: const TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.detailData.time,
                      style: const TextStyle(color: kTextShadow, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      //spacing: 50,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image(image: AssetImage("assets/images/Target.png"),
                              width: 40,
                              height: 60,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Target amount",
                                  style: const TextStyle(fontWeight: FontWeight.bold, color: kTextShadow, fontSize: 10),
                                ),
                                Text(
                                  widget.detailData.amount.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold, color: kTextColor, fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image(image: AssetImage("assets/images/Raise.png"),
                              width: 40,
                              height: 60,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Raised so far",
                                  style: const TextStyle(fontWeight: FontWeight.bold, color: kTextShadow, fontSize: 10),
                                ),
                                Text(
                                  widget.detailData.raised.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold, color: kTextColor, fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "By ",
                              style: const TextStyle(fontWeight: FontWeight.bold, color: kTextShadow, fontSize: 15),
                            ),
                            Text(
                              widget.detailData.organization,
                              style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(child: Container(
                              height: 120,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(
                                  widget.detailData.detail_desc,
                                  style: const TextStyle(color: kTextColor, fontSize: 15),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 200),
                    Container(
                      child: Column(
                        children: <Widget>[
                          TextButton(onPressed: () => showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  )
                              ),
                              context: context, builder: (context) => buildSheet()),
                              child: Text("Donate Now", style: TextStyle(
                                  fontSize: 15
                              )),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 150, vertical: 20)),
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor : MaterialStateProperty.all<Color>(kPrimaryColor),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          side: BorderSide(color: kPrimaryColor)
                                      )
                                  )
                              )
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      )
  );

  Widget buildSheet() => Container(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "How much wanna donate?",
                  style: const TextStyle(fontWeight: FontWeight.bold, color: kTextColor, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(onPressed: (){},
                        child: Text("\$50", style: TextStyle(fontSize: 20)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 53, vertical: 20)),
                            foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                            backgroundColor : MaterialStateProperty.all<Color>(kBackgroundColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: kPrimaryColor),
                                )
                            )
                        )),
                    TextButton(onPressed: (){},
                        child: Text("\$100", style: TextStyle(fontSize: 20)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                            foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                            backgroundColor : MaterialStateProperty.all<Color>(kBackgroundColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: kPrimaryColor),
                                )
                            )
                        )
                    ),

                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(onPressed: (){},
                        child: Text("\$150", style: TextStyle(fontSize: 20)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                            foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                            backgroundColor : MaterialStateProperty.all<Color>(kBackgroundColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: kPrimaryColor),
                                )
                            )
                        )),
                    TextButton(onPressed: (){},
                        child: Text("\$200", style: TextStyle(fontSize: 20)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 48, vertical: 20)),
                            foregroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                            backgroundColor : MaterialStateProperty.all<Color>(kBackgroundColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: kPrimaryColor),
                                )
                            )
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter price manually",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kBackgroundColor),
                  )
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Donation Confirmation"),
                      content: Text("Are you sure wanna donate?"),
                      actions: [
                        TextButton(
                          child: Text("No"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          child: Text("Yes"),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ));
              },

                child: Text("Donate", style: TextStyle(
                    fontSize: 15
                )),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 143, vertical: 20)),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor : MaterialStateProperty.all<Color>(kPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: kPrimaryColor)
                        )
                    )
                )
            ),
          ],
        ),
      )
  );
}