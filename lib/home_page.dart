import 'package:flutter/material.dart';
import 'package:mitha_bari/sweet_item/doi_item.dart';
import 'package:mitha_bari/sweet_item/laddu.dart';
import 'package:mitha_bari/sweet_item/sweet.dart';
import 'authentication/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
TextEditingController SearchController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: Colors.indigo[900],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Hey,👋"),
              accountEmail: Text("Riad Rayhan"),
              currentAccountPicture: CircleAvatar(child: CircleAvatar(backgroundImage: NetworkImage("https://e0.pxfuel.com/wallpapers/862/601/desktop-wallpaper-mahesh-babu-head-mahi-rishi-superstar-svp-mahesha.jpg"),)),
            ),
            ListTile(
              leading: Icon(Icons.man,color: Colors.white,), title: Text("profile",style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.home,color: Colors.white), title: Text("Home page",style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.card_travel_outlined,color: Colors.white), title: Text("My Cart",style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_border,color: Colors.white), title: Text("Favourites",style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark_border,color: Colors.white), title: Text("Orders",style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.notification_add,color: Colors.white), title: Text("Notification",style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(height: 2,color: Colors.white),
            ListTile(
              leading: Icon(Icons.login,color: Colors.white), title: Text("Sign Out",style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInScreen(),));
              },
            ),
          ],
        ),
      ),
      //========== drawer end =============//
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Text("Hi Riad !",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
            Text("    Good Day",style: TextStyle(letterSpacing: 6, color: Colors.green,),),
            // ========= start search bar ========//
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: SearchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => SearchController.clear(),
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Perform the search here
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            // ========== search bar end =============//
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(height: 10,),
                    SizedBox(width: 10,),
                    ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Color(
                        0xff2c3d26))),onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Sweets()));},
                        child: Text("Sweets",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold))),
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Doi()));},
                        child: Text("Doi",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Laddu()));},
                        child: Text("Ladoo",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Doi()));},
                        child: Text("Jilapi",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)),
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Laddu()));},
                        child: Text("Lacchi",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)),
                  ],
                ),
              ),
            ),
            // ============= food manu bar end ============//
            SizedBox(height: 10,),
            Text("Most Popular Foods",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,letterSpacing: 4,),),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(image: NetworkImage("https://img-global.cpcdn.com/recipes/8fbbc54037b1493f/1200x630cq70/photo.jpg"),fit: BoxFit.fill),
                                border: Border.all(color: Color(0xFF4FA811),width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xe4a2e590),
                                  offset: Offset(7, 7),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text("Rosogolla",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                              Container(
                                  width: 130,
                                  child:  Text("Rosogolla is a syrupy dessert popular in the eastern part of South Asia.",
                                    style: TextStyle(fontSize: 10,color: Colors.black26),textAlign: TextAlign.center,),
                              ),
                              Text("Per KG : ৳350",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.lightGreen),),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(image: NetworkImage("https://2.bp.blogspot.com/-9aLAe8mIigY/TsJ27qy3WGI/AAAAAAAABjY/ahsC3sST244/s1600/sugarfree-sondesh.jpg"),fit: BoxFit.fill),
                                border: Border.all(color: Color(0xFFDC7C7C),width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xe4a2e590),
                                  offset: Offset(7, 7),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text("Sondesh",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                           Container(
                             width: 130,
                             child:  Text("Sondesh is a syrupy dessert popular in the eastern part of South Asia.",
                               style: TextStyle(fontSize: 10,color: Colors.black26),textAlign: TextAlign.center,),
                           ),
                              Text("Per KG : ৳550",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.lightGreen),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // ========== first Row end here ============== //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(image: NetworkImage("https://www.cellsii.com/images/detailed/16/Doi-1-sora-in-bd_9nzk-4d.jpg"),fit: BoxFit.fill),
                                border: Border.all(color: Color(0xFF4FA811),width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xe4a2e590),
                                  offset: Offset(7, 7),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text("Sora Doi",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                              Container(
                                  width: 130,
                                  child:  Text("Sora Dodhi is a syrupy dessert popular in the eastern part of South Asia.",
                                    style: TextStyle(fontSize: 10,color: Colors.black26),textAlign: TextAlign.center,),
                              ),
                              Text("Per KG : ৳270",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.lightGreen),),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(image: NetworkImage("https://cdn.tasteatlas.com/Images/Dishes/6610f979d023438f94688e9e9ae951bb.jpg?m=facebook"),fit: BoxFit.fill),
                                border: Border.all(color: Color(0xFFDC7C7C),width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xe4a2e590),
                                  offset: Offset(7, 7),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text("Laddu",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                              Container(
                                  width: 120,
                                  child:  Text("Laddu is a syrupy dessert popular in the eastern part of South Asia.",
                                    style: TextStyle(fontSize: 10,color: Colors.black26),textAlign: TextAlign.center,),
                              ),
                              Text("Per KG : ৳210",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.lightGreen),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
