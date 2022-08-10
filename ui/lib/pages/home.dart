import 'package:Artivation/constants/constants.dart';
import 'package:Artivation/models/product.dart';
import 'package:Artivation/pages/cart/cart.dart';
import 'package:Artivation/screens/piece_details.dart';
import 'package:Artivation/screens/settings.dart';
import 'package:flutter/material.dart';
import 'dart:math';

var cardAspectRatio = 6 / 8;
var widgetAspectRatio = cardAspectRatio * 1.2;

class FragHome extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<FragHome> {
  double currentPage = products.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: products.length);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 14, top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                    size: Constants.iconSize,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    size: Constants.iconSize,
                  ),
                  onPressed: () {
                    print('Search bar');
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                    size: Constants.iconSize,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FragmentCart(),
                    ));
                  },
                ),
              ],
            ),
          ),
          // Container(child: BuildCategories()),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Featured',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Calibre-Semiold',
                      letterSpacing: 1),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    size: Constants.iconSize + 2,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserSettings(),
                    ));
                  },
                )
              ],
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height * .6,
            child: Stack(
              children: <Widget>[
                CardScrollWidget(currentPage),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: products.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ArtDetails(product: products[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 3),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("assets/pieces/1.jpg"),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 35;
  var verticalInset = 20;

  CardScrollWidget(this.currentPage);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: AspectRatio(
        aspectRatio: widgetAspectRatio,
        child: LayoutBuilder(
          builder: (context, constraints) {
            var width = constraints.maxWidth;
            var height = constraints.maxHeight;

            var safeWidth = width - 2 * padding;
            var safeHeight = height - 2 * padding;

            var heightOfPrimaryCard = safeHeight;
            var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

            var primaryCardLeft = safeWidth - widthOfPrimaryCard;
            var horizontalInset = primaryCardLeft / 2;

            List<Widget> cardList = [];

            for (var i = 0; i < products.length; i++) {
              var delta = i - currentPage;
              bool isOnRight = delta > 0;
              var start = padding +
                  max(
                    primaryCardLeft -
                        horizontalInset * -delta * (isOnRight ? 15 : 1),
                    0.0,
                  );

              var cardItem = Positioned.directional(
                top: padding + verticalInset * max(-delta, 0.0),
                bottom: padding + verticalInset * max(-delta, 0.0),
                start: start,
                textDirection: TextDirection.rtl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            offset: Offset(3, -6),
                            blurRadius: 10,
                          ),
                        ]),
                    child: AspectRatio(
                      aspectRatio: cardAspectRatio,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Hero(
                            tag: 'image${products[i].id}',
                            child: Image.asset(
                              products[i].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Container(
                                    padding: EdgeInsets.all(2.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blueGrey[400]
                                              .withOpacity(.1),
                                          offset: Offset(2, 3),
                                          blurRadius: 12,
                                        )
                                      ],
                                      color: Colors.black.withOpacity(.2),
                                    ),
                                    child: Text(
                                      products[i].title,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily: 'SF-Pro-Text-Regular'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
              cardList.add(cardItem);
            }
            return Stack(
              children: cardList,
            );
          },
        ),
      ),
    );
  }
}
