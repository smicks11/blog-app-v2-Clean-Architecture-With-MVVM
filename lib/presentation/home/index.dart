// import 'package:blog_app/widgets/Text.dart';
// ignore_for_file: prefer_const_constructors
import 'package:blog_app_v2/app/di.dart';
import 'package:blog_app_v2/presentation/home/home_vm.dart';
import 'package:flutter/material.dart';
import 'components/featured_new_component.dart';
import 'components/popular_news.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel _viewModel = instance<HomeViewModel>();
  // HomeViewModel _viewModel = HomeViewModel();
  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind(){
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<NewsViewObject>(
          stream: _viewModel.outputHomeData,
          builder: (context, snapshot) {
              return _contentWidget(snapshot.data);
          }
        ),
      ),
      // bottomNavigationBar: BottomTab(),
    );
  }

  
Widget _contentWidget (NewsViewObject? newsViewObject) {
  if(newsViewObject == null){
    return Container(child: Center(child: Text("An error occured")));
  } else {
        return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.only(left: 20),
      child: ListView(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: 30, child: Text("Blog")),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Featured",
                  style: TextStyle(
                    fontSize: 40,
                    // color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  "Based on your interest",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            height: 300,
            width: double.infinity,
            // color: Colors.blue,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return FeaturedNews();
              },
            ),
          ),
          Divider(),
          Container(
            height: 70,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 3,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "Top Headlines",
                  style: TextStyle(
                    fontSize: 24,
                    // color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            // height: double.infinity,
            // width: double.infinity,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) {
                return PopularNews();
              },
            ),
          )
        ],
      ),
    );
  }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}




