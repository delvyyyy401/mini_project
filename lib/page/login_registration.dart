// import 'package:flutter/material.dart';
// import 'package:mini_project/constants.dart';
//
// import 'dashboard.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
// class _LoginScreenState extends State<LoginScreen> {
//
//   bool hide = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: kBackgroundColor,
//       body: Stack(
//         children: [
//           Positioned(
//               top:80, left: 70,
//               child: Image(
//                 image: AssetImage("images/Ok.png"),
//                 height: 250,
//                 width: 300,
//               )
//           ),
//           Positioned(
//               top: 390, left: 140,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text("Welcome back!", style: TextStyle(fontSize: 13, color: kTextColor)),
//                   Text("Please, Log In.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: kTextColor))
//                 ],
//               )
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//             margin: EdgeInsets.only(top: 460, right: 20, left: 20),
//             width: double.infinity,
//             height: 400,
//
//             child: Column(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                       hintText: "Username",
//                       prefixIcon: Icon(Icons.person),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide(color: kBackgroundColor),
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 15,),
//                 TextButton(
//                   obscureText: hide,
//                   decoration: InputDecoration(
//                       hintText: "Password",
//                       suffixIcon: IconButton(
//                         onPressed: (){
//                           setState((){
//                             hide = !hide;
//                           });
//                         },
//                         icon: hide?Icon(Icons.visibility_off):Icon(Icons.visibility),
//                       ),
//                       prefixIcon: Icon(Icons.key),
//
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: kBackgroundColor),
//                         borderRadius: BorderRadius.circular(30),
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 15,),
//                 TextButton(onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentScreen()));
//                 },
//                     child: Text("Continue", style: TextStyle(
//                         fontSize: 15
//                     )),
//                     style: ButtonStyle(
//                         padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 137, vertical: 10)),
//                         foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                         backgroundColor : MaterialStateProperty.all<Color>(kPrimaryColor),
//                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 side: BorderSide(color: kPrimaryColor)
//                             )
//                         )
//                     )
//                 ),
//
//               ],
//
//             ),
//           ),
//           Positioned(
//               left: 40, bottom: 50,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text("or", style: TextStyle(fontSize: 15)),
//                   SizedBox(height: 25),
//                   TextButton(onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
//                   },
//                     child: Text("Create an Account", style: TextStyle(
//                         fontSize: 15
//                     )),
//                     style: ButtonStyle(
//                       padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 110, vertical: 10)),
//                       foregroundColor: MaterialStateProperty.all<Color>(kTextLightColor),
//                       backgroundColor : MaterialStateProperty.all<Color>(kPrimaryColor),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             side: BorderSide(color: kPrimaryColor)
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class RegisterScreen extends StatefulWidget {
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
// class _RegisterScreenState extends State<RegisterScreen> {
//   bool hide = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: kBackgroundColor,
//       body: Stack(
//         children: [
//           Positioned(
//               top:80, left: 40,
//               child: Image(
//                 image: AssetImage("images/Hi.png"),
//                 height: 250,
//                 width: 300,
//               )
//           ),
//           Positioned(
//               top: 390, left: 130,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text("Hi there!", style: TextStyle(fontSize: 13, color: kTextColor)),
//                   Text("Let's Get Started", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: kTextColor))
//                 ],
//               )
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//             margin: EdgeInsets.only(top: 460, right: 20, left: 20),
//             width: double.infinity,
//             height: 400,
//
//             child: Column(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                       hintText: "Username",
//                       prefixIcon: Icon(Icons.person),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide(color: kBackgroundColor),
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 15,),
//                 TextField(
//                   obscureText: hide,
//                   decoration: InputDecoration(
//                       hintText: "Password",
//                       suffixIcon: IconButton(
//                         onPressed: (){
//                           setState((){
//                             hide = !hide;
//                           });
//                         },
//                         icon: hide?Icon(Icons.visibility_off):Icon(Icons.visibility),
//                       ),
//                       prefixIcon: Icon(Icons.key),
//
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: kBackgroundColor),
//                         borderRadius: BorderRadius.circular(30),
//                       )
//                   ),
//                 ),
//                 SizedBox(height: 15,),
//                 TextButton(onPressed: (){},
//                     child: Text("Create an Account"),
//                     style: ButtonStyle(
//                         padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 110, vertical: 10)),
//                         foregroundColor: MaterialStateProperty.all<Color>(kTextLightColor),
//                         backgroundColor : MaterialStateProperty.all<Color>(kPrimaryColor),
//                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 side: BorderSide(color: kPrimaryColor)
//                             )
//                         )
//                     )
//                 ),
//
//               ],
//
//             ),
//           ),
//           Positioned(
//               left: 40, bottom: 50,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text("or", style: TextStyle(fontSize: 15)),
//                   SizedBox(height: 25),
//                   TextButton(onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
//                   },
//                     child: Text("Login", style: TextStyle(
//                         fontSize: 15
//                     )),
//                     style: ButtonStyle(
//                       padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 150, vertical: 10)),
//                       foregroundColor: MaterialStateProperty.all<Color>(kTextLightColor),
//                       backgroundColor : MaterialStateProperty.all<Color>(kPrimaryColor),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             side: BorderSide(color: kPrimaryColor)
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//           ),
//         ],
//       ),
//     );
//   }
// }
