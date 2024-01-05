import 'package:audio_kumbh/app/widgets/audio_text.dart';
import 'package:audio_kumbh/app/widgets/author_item_view.dart';
import 'package:audio_kumbh/app/widgets/book_cart_view.dart';
import 'package:audio_kumbh/app/widgets/category_item_view.dart';
import 'package:audio_kumbh/app/widgets/publisher_item_view.dart';
import 'package:audio_kumbh/constant/string_constant.dart';
import 'package:audio_kumbh/constant/theme_constant.dart';
import 'package:audio_kumbh/provider/home_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app/widgets/audio_language.dart';
import '../generated/l10n.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    Provider.of<HomeProvider>(context, listen: false).removeListener(themeListener);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).addListener(themeListener);
    // TODO: implement initState
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getAudioData();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  List author = [];
  List publisherData = [];

  HomeProvider? homeProviderT;
  HomeProvider? homeProviderF;

  @override
  Widget build(BuildContext context) {
    homeProviderT = context.watch<HomeProvider>();
    homeProviderF = context.read<HomeProvider>();

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawerEnableOpenDragGesture: false,
        drawer: Drawer(
            child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(children: [
            SizedBox(
              height: 3.h,
            ),
            Card(
              child: ListTile(
                title: Text(S.of(context).changeTheme),
                trailing: SizedBox(
                  height: 4.h,
                  width: 5.w,
                  child: Switch(
                    activeColor: Colors.black,
                    activeTrackColor: Colors.grey,
                    inactiveThumbColor: const Color(0xff512A00),
                    inactiveTrackColor: Colors.white,
                    value: homeProviderT!.themeMode == ThemeMode.dark,
                    onChanged: (newValue) {
                      homeProviderT!.toggleTheme(newValue);
                    },
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(S.of(context).changeLanguage),
                trailing: Container(
                  height: 4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff512A00).withOpacity(0.7),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      padding: const EdgeInsets.all(5),
                      dropdownColor: const Color(0xff512A00),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(5),
                      value: homeProviderF!.lang,
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "es",
                          child: Text('English'),
                        ),
                        DropdownMenuItem(
                          value: "hi",
                          child: Text('Hindi'),
                        ),
                        DropdownMenuItem(
                          value: "gu",
                          child: Text('Gujarati'),
                        ),
                      ],
                      onChanged: (value) {
                        MyApp.of(context)?.setLocale(Locale.fromSubtags(languageCode: value!));
                        homeProviderF!.setLocal(value!);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ]),
        )),
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          flexibleSpace: Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  height: 30.h,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: homeProviderT!.mythemeMode == ThemeMode.dark
                            ? const Color(0xffFFE2D2)
                            : const Color(0xff512A00).withOpacity(0.6),
                        width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.search,
                        // color: Color(0xff512A00),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      AppText(
                        title: S.of(context).searchHere,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: const [],
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 3.h,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.book,
                // color: Color(0xff512A00),
              ),
              label: "Book",
            ),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.podcast,
                  // color: Color(0xff512A00),
                ),
                label: "Baudhik"),
            BottomNavigationBarItem(
                icon: FaIcon(
                  Icons.music_note,
                  // color: Color(0xff512A00),
                ),
                label: "Geet"),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.bookBookmark,
                  // color: Color(0xff512A00),
                ),
                label: "Library"),
          ],
        ),
        body: Consumer<HomeProvider>(
          builder: (context, HomeProvider value, child) {
            if (value.isload) {
              return const Center(
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
                        height: 0.5.h,
                      ),
                      CarouselSlider.builder(
                          itemCount: value.audioModel!.data.banner.length,
                          itemBuilder: (context, index, realIndex) => Padding(
                                padding: const EdgeInsets.all(8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    value.audioModel!.data.banner[index].img,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          options: CarouselOptions(
                            height: 20.h,
                            viewportFraction: 1,
                            autoPlay: true,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                            autoPlayCurve: Curves.linear,
                            autoPlayInterval: const Duration(seconds: 3),
                            onPageChanged: (index, reason) {
                              value.changeIndex(index);
                            },
                          )),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: value.audioModel!.data.banner
                            .asMap()
                            .entries
                            .map((e) => Container(
                                  height: 1.h,
                                  width: 1.h,
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: homeProviderT!.mythemeMode == ThemeMode.dark
                                          ? darkColor
                                          : lightColor,
                                    ),
                                    color: e.key == value.imgindex
                                        ? const Color(0xff512A00)
                                        : Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ))
                            .toList(),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: AppText(
                          title: S.of(context).category,
                          fontSize: 18.sp,
                          // fontColor: Color(0xff512A00),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: value.audioModel!.data.category.length,
                          itemBuilder: (context, index) {
                            return CategoryItem(
                              categoryName: value.audioModel!.data.category[index].name,
                              categoryUseFor:
                                  "${value.audioModel!.data.category[index].total} ${value.audioModel!.data.category[index].useFor}",
                              gradient: value.linearGradients[index],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 7.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: value.audioModel!.data.language.length,
                          itemBuilder: (context, index) {
                            return LanguageContainer(
                              languageName: value.audioModel!.data.language[index].name,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).ourAuhors,
                              style: GoogleFonts.quicksand(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/authors', arguments: author);
                              },
                              child: Text(
                                S.of(context).viewAll,
                                style: GoogleFonts.quicksand(
                                    fontSize: 15.sp,
                                    color: homeProviderT!.mythemeMode == ThemeMode.dark
                                        ? darkColor
                                        : lightColor.withOpacity(0.5),
                                    // color: const Color(0xff512A00).withOpacity(0.5),
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      SizedBox(
                        height: 20.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: value.audioModel!.data.section.length,
                          itemBuilder: (context, index) {
                            return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: value.audioModel!.data.section[index].author.length,
                              itemBuilder: (context, authorIndex) {
                                author = value.audioModel!.data.section[index].author;
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: AuthorItem(
                                    networkImage: value
                                        .audioModel!.data.section[index].author[authorIndex].img,
                                    authorName: value
                                        .audioModel!.data.section[index].author[authorIndex].name,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.audioModel!.data.section.length,
                        itemBuilder: (context, index) {
                          return
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              value.audioModel!.data.section[index].audioBook.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "  ${value.audioModel!.data.section[index].title}",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 18.sp,
                                            // color: const Color(0xff512A00),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 10.w,
                                              child: IconButton(
                                                onPressed: () {
                                                  value.audioModel!.data.section[index].isShow =
                                                      !value.audioModel!.data.section[index].isShow;
                                                },
                                                icon: value.audioModel!.data.section[index].isShow
                                                    ? const Icon(Icons.keyboard_arrow_down)
                                                    : const Icon(Icons.expand_less),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  '/data',
                                                  arguments: {
                                                    "data1": value
                                                        .audioModel!.data.section[index].audioBook,
                                                    "data2":
                                                        value.audioModel!.data.section[index].title,
                                                  },
                                                );
                                              },
                                              child: Text(
                                                AppStringConst.viewAll,
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 15.sp,
                                                    color:
                                                        homeProviderT!.mythemeMode == ThemeMode.dark
                                                            ? darkColor
                                                            : lightColor.withOpacity(0.5),
                                                    // color: const Color(0xff512A00).withOpacity(0.5),
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  : Container(),
                              Visibility(
                                visible:
                                    value.audioModel!.data.section[index].isShow ? true : false,
                                child: SizedBox(
                                  height: value.audioModel!.data.section[index].audioBook.isNotEmpty
                                      ? 30.h
                                      : 0,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    physics: const BouncingScrollPhysics(),
                                    itemCount:
                                        value.audioModel!.data.section[index].audioBook.length,
                                    itemBuilder: (context, audioIndex) {
                                      return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: BookCartItem(
                                            bookImage: value.audioModel!.data.section[index]
                                                .audioBook[audioIndex].img,
                                            audioBookName: value.audioModel!.data.section[index]
                                                .audioBook[audioIndex].name,
                                            bookAuhorName: value.audioModel!.data.section[index]
                                                .audioBook[audioIndex].author.name,
                                          ));
                                    },
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).Publisher,
                              style: GoogleFonts.quicksand(
                                  fontSize: 18.sp,
                                  // color: const Color(0xff512A00),
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/publisher',
                                    arguments: publisherData);
                              },
                              child: Text(
                                S.of(context).viewAll,
                                style: GoogleFonts.quicksand(
                                    fontSize: 15.sp,
                                    color: homeProviderT!.mythemeMode == ThemeMode.dark
                                        ? darkColor
                                        : lightColor.withOpacity(0.5),
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.1.h,
                      ),
                      SizedBox(
                        height: 18.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          physics: const BouncingScrollPhysics(),
                          itemCount: value.audioModel!.data.section.length,
                          itemBuilder: (context, index) {
                            return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: value.audioModel!.data.section[index].publisher.length,
                              itemBuilder: (context, publisherIndex) {
                                publisherData = value.audioModel!.data.section[index].publisher;
                                return PublisherItem(
                                    networkImage: value.audioModel!.data.section[index]
                                        .publisher[publisherIndex].img,
                                    publisherName: value.audioModel!.data.section[index]
                                        .publisher[publisherIndex].name);
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Audio Kumbh",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600, fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 0.1.h,
                            ),
                            Text(
                              "Version:3.0.7",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w500, fontSize: 12.sp),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 45.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      const url = "https://www.facebook.com/";
                                      if (await canLaunchUrl(Uri.parse(url))) {
                                        await launchUrl(Uri.parse(url));
                                      } else {
                                        throw 'could not launch $url';
                                      }
                                    },
                                    child: const FaIcon(
                                      FontAwesomeIcons.facebook,
                                      size: 16,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      const url = "https://www.instagram.com/";
                                      if (await canLaunchUrl(Uri.parse(url))) {
                                        await launchUrl(Uri.parse(url));
                                      } else {
                                        throw 'could not launch $url';
                                      }
                                    },
                                    child: const FaIcon(
                                      FontAwesomeIcons.instagram,
                                      size: 16,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      const url = "https://telegram.org/apps";
                                      if (await canLaunchUrl(Uri.parse(url))) {
                                        await launchUrl(Uri.parse(url));
                                      } else {
                                        throw 'could not launch $url';
                                      }
                                    },
                                    child: const FaIcon(
                                      FontAwesomeIcons.telegram,
                                      size: 16,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      const url = "https://twitter.com/";
                                      if (await canLaunchUrl(Uri.parse(url))) {
                                        await launchUrl(Uri.parse(url));
                                      } else {
                                        throw 'could not launch $url';
                                      }
                                    },
                                    child: const FaIcon(
                                      FontAwesomeIcons.twitter,
                                      size: 16,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      const url = "https://www.youtube.com/";
                                      if (await canLaunchUrl(Uri.parse(url))) {
                                        await launchUrl(Uri.parse(url));
                                      } else {
                                        throw 'could not launch $url';
                                      }
                                    },
                                    child: const FaIcon(
                                      FontAwesomeIcons.youtube,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
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
            return const Text("No Data Found");
          },
        ),
      ),
    );
  }
}
