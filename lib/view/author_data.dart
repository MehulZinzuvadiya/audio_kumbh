import 'package:audio_kumbh/app/widgets/author_item_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorScreen extends StatefulWidget {
  const AuthorScreen({super.key});

  @override
  State<AuthorScreen> createState() => _AuthorScreenState();
}

class _AuthorScreenState extends State<AuthorScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as List;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Our Authors",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            // color: Color(0xff512A00),
          ),
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            // color: Color(0xff512A00),
            size: 18,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 130,
          ),
          itemCount: args.length,
          itemBuilder: (context, index) {
            return AuthorItem(
                networkImage: "${args[index].img}", authorName: "${args[index].name}");
          },
        ),
      ),
    ));
  }
}
