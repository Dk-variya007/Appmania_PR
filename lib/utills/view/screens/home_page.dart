import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pr_petappmania/utills/route_utills.dart';
import '../../product_utills.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return Scaffold(
      backgroundColor: Color(0xff92EDC3),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pet Shop"),
        actions: [
          const Padding(
            padding: EdgeInsets.all(5),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(MyRoutes.cartPage);
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.shopping_cart_checkout_sharp,
                size: 25,
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xff5CDBFF),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: h * 0.04,
              child: const Text(
                "Top pet's",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xffF87C79),
                  fontWeight: FontWeight.bold,
                ),
              ),
              // color: Colors.red,
            ),
            CarouselSlider(
              items: [
                ...allImages
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.all(10),
                        height: size.height * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(3, 3),
                              blurRadius: 15,
                              blurStyle: BlurStyle.solid,
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(e),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
              options: CarouselOptions(
                height: size.height * 0.4,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
