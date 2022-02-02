import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedNews extends StatelessWidget {
  final String? title;
  final String? bannerImg;
  final String? authorImg;
  final String? desc;
  final String? authorName;
  const FeaturedNews({Key? key, this.title, this.authorImg, this.bannerImg, this.desc, this.authorName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        // height: 250,
        padding: EdgeInsets.only(right: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            child: Image.network(
              bannerImg!,
              height: 180,
              width: MediaQuery.of(context).size.width * 0.9,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          SizedBox(
            height: 16,
          ),
          Column(children: [
            Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 300.0,
                  maxWidth: 300.0,
                  minHeight: 60.0,
                  maxHeight: 100.0,
                ),
                child: Text(
                  desc!,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    // color: Colors.black
                  )),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: ClipRRect(
                        child: Image.network(
                          authorImg!,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 0.0,
                          maxWidth: 120.0,
                          minHeight: 15.0,
                          maxHeight: 40.0,
                        ),
                        child: Text(
                          authorName!,
                          style: TextStyle(
                            fontSize: 15,
                            // color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // SizedBox(width: 95),
                Text(
                  // timeago.format(time),
                  "3hrs ago",
                  style: TextStyle(
                    fontSize: 12,
                    // color:  Colors.black26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ])
        ]));
  }
}
