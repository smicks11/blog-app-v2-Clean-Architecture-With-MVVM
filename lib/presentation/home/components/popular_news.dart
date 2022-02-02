import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularNews extends StatelessWidget {
  final String? title;
  final String? bannerImg;
  final String? authorImg;
  final String? desc;
  final String? authorName;
  const PopularNews({Key? key, this.title, this.bannerImg, this.authorImg, this.desc, this.authorName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 12),
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 300.0,
                      maxWidth: 300.0,
                      minHeight: 30.0,
                      maxHeight: 100.0,
                    ),
                    child: Text(
                      title!,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        // color: Colors.black
                      )),
                      // minFontSize: 16,
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

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
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        // color: Colors.black26
                      )),
                      overflow: TextOverflow.ellipsis,
                      // minFontSize: 13,
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                // SizedBox(
                //   height: 10,
                // ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        authorName!,
                        style: TextStyle(
                          fontSize: 14,
                          // color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                        // width: 44,
                        ),
                    Container(
                      // width: 80,
                      child: Text(
                        "2hrs ago",
                        style: TextStyle(
                          fontSize: 12,
                          // color: Colors.black26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              // height: 120,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              // margin: EdgeInsets.only(right: 20),
              child: ClipRRect(
                child: Image.network(
                  bannerImg!,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
          // ClipRRect(
          //   child: Image.asset(
          //     widget.popularListBuild.image,
          //     height: 100,
          //     width: 80,
          //   ),
          //   borderRadius: BorderRadius.circular(20),
          // )
        ],
      ),
    );
  }
}
