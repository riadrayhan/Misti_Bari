import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../order_page.dart';

class Laddu extends StatefulWidget {
  const Laddu({super.key});

  @override
  State<Laddu> createState() => _LadduState();
}

class _LadduState extends State<Laddu> {

  List<dynamic> posts = [];

  Future<void> downloadJson() async {
    final api =
        "https://raw.githubusercontent.com/riadrayhan/Misti_Bari/main/Laddu";

    final response = await get(Uri.parse(api));
    if (response.statusCode == 200) {
      setState(() {
        posts = json.decode(response.body);
      });
    } else {
      throw Exception("Connection problem");
    }
  }

  @override
  void initState() {
    super.initState();
    downloadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Laddu",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFEA9E94),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            //========== Image Slider start ============//
            CarouselSlider(
              items: [
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://www.shutterstock.com/shutterstock/photos/2301730065/display_1500/stock-vector-get-extra-percent-off-sale-neumorphic-background-with-speech-bubble-discount-offer-price-sign-2301730065.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://www.isitwp.com/wp-content/uploads/2020/04/buy-1-get-1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://png.pngitem.com/pimgs/s/533-5335915_free-delivery-offer-information-free-delivery-hd-png.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://www.shutterstock.com/shutterstock/photos/2301730065/display_1500/stock-vector-get-extra-percent-off-sale-neumorphic-background-with-speech-bubble-discount-offer-price-sign-2301730065.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://scontent.fdac99-1.fna.fbcdn.net/v/t39.30808-6/302750216_417825907006920_8033267469805265268_n.jpg?stp=dst-jpg_s960x960&_nc_cat=110&ccb=1-7&_nc_sid=52f669&_nc_eui2=AeHqlAH5AQAMRAra6YJf-VYWevi7u692Ca56-Lu7r3YJrkrIx7Ge5zbXmKAmgbkEnR_6wvy-sdaLR1bmjtklFRAA&_nc_ohc=UnHSvSWL4jUAX_AwEfF&_nc_oc=AQn--CB-mJdoCSBoEQd2yAJweUJIk9hX4WpLBJGKj6CI5uQo3EEfqblGNfn7eZkt7AY&_nc_ht=scontent.fdac99-1.fna&oh=00_AfCbnJkEqjtSJExcYUaEx_q06ka3nxV8LxYp8Je8ke6OKQ&oe=650F1061"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),

            //============  Image Slider End  ==============//
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                mainAxisSpacing: 20.0, // Add vertical spacing
              ),
              itemCount: posts.length,
              shrinkWrap: true, // Use shrinkWrap to allow the grid to fit within the ListView
              physics:
              NeverScrollableScrollPhysics(), // Disable scrolling for the grid
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to OrderPage and pass data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(
                          imageurl: posts[index]['imageurl'],
                          name: posts[index]['name'],
                          price: posts[index]['price'],
                          description: posts[index]['description'], key: UniqueKey() ,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: NetworkImage(posts[index]['imageurl']),
                                fit: BoxFit.fill,
                              ),
                              border:
                              Border.all(color: Color(0xFFDC7C7C), width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xe4a2e590),
                                  offset: Offset(7, 7),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          posts[index]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Text(
                          posts[index]['price'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
