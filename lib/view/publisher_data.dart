import 'package:audio_kumbh/app/widgets/publisher_item_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PublisherScreen extends StatefulWidget {
  const PublisherScreen({super.key});

  @override
  State<PublisherScreen> createState() => _PublisherScreenState();
}

class _PublisherScreenState extends State<PublisherScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as List;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Publisher",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xff512A00),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff512A00),
            size: 18,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 130,
          ),
          itemCount: args.length,
          itemBuilder: (context, index) {
            return PublisherItem(
              networkImage: "${args[index].img}",
              publisherName: "${args[index].name}",
            );
          },
        ),
      ),
    ));
  }
}
