import 'package:audio_kumbh/app/widgets/book_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map ?? {};
    var data1 = args['data1'];
    var data2 = args['data2'];

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
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
        title: Text(
          "${data2}",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xff512A00),
          ),
        ),
        centerTitle: true,
      ),
      body: Flexible(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 250,
          ),
          itemCount: data1.length,
          itemBuilder: (context, index) {
            return BookCartItem(
                bookImage: "${data1[index].img}",
                audioBookName: "${data1[index].name}",
                bookAuhorName: "${data1[index].author.name}");
            // return Container(
            //   margin: EdgeInsets.all(10),
            //   child: Column(
            //     children: [
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(6),
            //         child: Image.network(
            //           "${data1[index].img}",
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //       SizedBox(
            //         height: 5,
            //       ),
            //       Container(
            //         width: 90,
            //         child: Text(
            //           "${data1[index].name}",
            //           overflow: TextOverflow.ellipsis,
            //           style: GoogleFonts.quicksand(
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //       Container(
            //         width: 90,
            //         child: Text(
            //           "${data1[index].author.name}",
            //           overflow: TextOverflow.ellipsis,
            //           style: GoogleFonts.quicksand(),
            //         ),
            //       ),
            //     ],
            //   ),
            // );
          },
        ),
      ),
      // ListView.builder(
      //   itemCount: args.length,
      //   itemBuilder: (context, index) {
      //     return Text("${args[index].name}");
      //   },
      // ),
    ));
  }
}
