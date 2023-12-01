import 'package:audio_kumbh/app/widgets/audio_text.dart';
import 'package:audio_kumbh/app/widgets/author_item_view.dart';
import 'package:audio_kumbh/app/widgets/book_cart_view.dart';
import 'package:audio_kumbh/app/widgets/category_item_view.dart';
import 'package:audio_kumbh/app/widgets/publisher_item_view.dart';
import 'package:audio_kumbh/constant/string_constant.dart';
import 'package:audio_kumbh/provider/home_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../app/widgets/audio_language.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<HomeProvider>(context).getAudioData();
    // context.watch<HomeProvider>().getAudioData();
    Provider.of<HomeProvider>(context, listen: false).getAudioData();
  }

  List author = [];
  List publisherData = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          icon: Icon(
            Icons.menu,
            color: Color(0xff512A00),
          ),
        ),
        title: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xff512A00), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                color: Color(0xff512A00),
              ),
              SizedBox(
                width: 5,
              ),
              AppText(
                title: "Search Here",
                fontColor: Color(0xff512A00),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 16,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.book,
              color: Color(0xff512A00),
            ),
            label: "Book",
          ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.towerBroadcast,
                color: Color(0xff512A00),
              ),
              label: "Baudhik"),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.music,
                color: Color(0xff512A00),
              ),
              label: "Geet"),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.bookBookmark,
                color: Color(0xff512A00),
              ),
              label: "Library"),
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, HomeProvider value, child) {
          if (value.isload) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 3,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
              ),
            );
          }
          if (value.audioModel != null) {
            return RefreshIndicator(
              onRefresh: () async {
                await value.getAudioData();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CarouselSlider.builder(
                        itemCount: value.audioModel!.data.banner.length,
                        itemBuilder: (context, index, realIndex) => Padding(
                              padding: const EdgeInsets.all(2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "${value.audioModel!.data.banner[index].img}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        options: CarouselOptions(
                          height: 150,
                          viewportFraction: 1,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                          autoPlayCurve: Curves.linear,
                          autoPlayInterval: Duration(seconds: 3),
                          onPageChanged: (index, reason) {
                            print(index);
                            value.ChangeIndex(index);
                          },
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: value.audioModel!.data.banner
                          .asMap()
                          .entries
                          .map((e) => Container(
                                height: 6,
                                width: 6,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: e.key == value.imgindex
                                      ? Colors.black
                                      : Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: AppText(
                        title: AppStringConst.category,
                        fontSize: 18,
                        fontColor: Color(0xff512A00),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: value.audioModel!.data.category.length,
                        itemBuilder: (context, index) {
                          return CategoryItem(
                            categoryName:
                                "${value.audioModel!.data.category[index].name}",
                            categoryUseFor:
                                "${value.audioModel!.data.category[index].total} ${value.audioModel!.data.category[index].useFor}",
                            gradient: value.linearGradients[index],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 55,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: value.audioModel!.data.language.length,
                        itemBuilder: (context, index) {
                          return LanguageContainer(
                            languageName:
                                "${value.audioModel!.data.language[index].name}",
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "  Our Authors",
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                            color: Color(0xff512A00),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/authors',
                                arguments: author);
                            print(author);
                          },
                          child: Text(
                            "View All  ",
                            style: GoogleFonts.quicksand(
                                fontSize: 12, color: Color(0xff512A00)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 140,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: value.audioModel!.data.section.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 200,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: value.audioModel!.data.section[index]
                                  .author.length,
                              itemBuilder: (context, authorIndex) {
                                author = value
                                    .audioModel!.data.section[index].author;
                                return AuthorItem(
                                    networkImage:
                                        "${value.audioModel!.data.section[index].author[authorIndex].img}",
                                    authorName:
                                        "${value.audioModel!.data.section[index].author[authorIndex].name}");
                              },
                            ),
                          );
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Container(
                          //     height: 150,
                          //     width: 120,
                          //     padding: EdgeInsets.all(10),
                          //     child: Column(
                          //       children: [
                          //         Container(
                          //           height: 100,
                          //           width: 40,
                          //           child: Image.network(
                          //               "${value.audioModel!.data.section[index].audioBook[index].img}"),
                          //         ),
                          //         Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceEvenly,
                          //           children: [
                          //             Text(
                          //               "${value.audioModel!.data.category[index].total}",
                          //               style: GoogleFonts.poppins(
                          //                   color: Colors.white),
                          //             ),
                          //             Text(
                          //               "${value.audioModel!.data.category[index].useFor}",
                          //               style: GoogleFonts.poppins(
                          //                   color: Colors.white),
                          //             ),
                          //             Icon(
                          //               Icons.arrow_circle_right,
                          //               color: Colors.white,
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: value.audioModel!.data.section.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: value.audioModel!.data.section[index]
                                  .audioBook.isNotEmpty
                              ? 270
                              : 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              value.audioModel!.data.section[index].audioBook
                                      .isNotEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "  ${value.audioModel!.data.section[index].title}",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 18,
                                            color: Color(0xff512A00),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                              context,
                                              '/data',
                                              arguments: {
                                                "data1": value.audioModel!.data
                                                    .section[index].audioBook,
                                                "data2": value.audioModel!.data
                                                    .section[index].title,
                                              },
                                            );
                                          },
                                          child: Text(
                                            AppStringConst.viewAll,
                                            style: GoogleFonts.quicksand(
                                                fontSize: 12,
                                                color: Color(0xff512A00)),
                                          ),
                                        )
                                      ],
                                    )
                                  : Container(),
                              value.audioModel!.data.section[index].audioBook
                                      .isNotEmpty
                                  ? Flexible(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        physics: BouncingScrollPhysics(),
                                        itemCount: value.audioModel!.data
                                            .section[index].audioBook.length,
                                        itemBuilder: (context, audioIndex) {
                                          return BookCartItem(
                                              bookImage:
                                                  "${value.audioModel!.data.section[index].audioBook[audioIndex].img}",
                                              audioBookName:
                                                  "${value.audioModel!.data.section[index].audioBook[audioIndex].name}",
                                              bookAuhorName:
                                                  "${value.audioModel!.data.section[index].audioBook[audioIndex].author.name}");
                                        },
                                      ),
                                    )
                                  : Center(
                                      child: Container(
                                      height: 0,
                                      width: 0,
                                    )),
                            ],
                          ),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "  Publisher",
                          style: GoogleFonts.quicksand(
                              fontSize: 16,
                              color: Color(0xff512A00),
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/publisher',
                                arguments: publisherData);
                          },
                          child: Text(
                            "View All  ",
                            style: GoogleFonts.quicksand(
                                fontSize: 12, color: Color(0xff512A00)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 140,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        physics: BouncingScrollPhysics(),
                        itemCount: value.audioModel!.data.section.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 200,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: value.audioModel!.data.section[index]
                                  .publisher.length,
                              itemBuilder: (context, publisherIndex) {
                                publisherData = value
                                    .audioModel!.data.section[index].publisher;
                                return PublisherItem(
                                    networkImage:
                                        "${value.audioModel!.data.section[index].publisher[publisherIndex].img}",
                                    publisherName:
                                        "${value.audioModel!.data.section[index].publisher[publisherIndex].name}");
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AUDIO KUMBH",
                            style: GoogleFonts.quicksand(
                                color: Color(0xff512A00),
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                          Text(
                            "Version:3.0.7",
                            style: GoogleFonts.quicksand(
                                color: Color(0xff512A00),
                                fontWeight: FontWeight.bold,
                                fontSize: 8),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Color(0xff512A00),
                                  size: 15,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Color(0xff512A00),
                                  size: 15,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.telegram,
                                  color: Color(0xff512A00),
                                  size: 15,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Color(0xff512A00),
                                  size: 15,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.youtube,
                                  color: Color(0xff512A00),
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          )
                        ],
                      ),
                    ),
                    // homeProvider!.audioModel != null
                    //     ? Text(
                    //         "${homeProvider!.audioModel!.data.}",
                    //         style: GoogleFonts.poppins(
                    //           fontSize: 12,
                    //         ),
                    //       )
                    //     : const SizedBox(),
                    // Expanded(
                    //   child: FutureBuilder(
                    //     future: ht!.getAudioData(),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.hasError) {
                    //         return Text("${snapshot.error}");
                    //       } else if (snapshot.hasData) {
                    //         AudioModel? a1 = snapshot.data;
                    //         return ListView.builder(
                    //           itemCount: a1!.data.category.length,
                    //           itemBuilder: (context, index) {
                    //             return Text("${a1.data.category[index].name}");
                    //           },
                    //         );
                    //       }
                    //       return Center(child: CircularProgressIndicator());
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }
          return Text("No Data Found");
        },
      ),
    ));
  }
}
