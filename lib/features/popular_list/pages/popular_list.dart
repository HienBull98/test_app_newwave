import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularListPage extends StatefulWidget {
  const PopularListPage({Key? key}) : super(key: key);

  @override
  State<PopularListPage> createState() => _PopularListPageState();
}

class _PopularListPageState extends State<PopularListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: const Text(
          "Back",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Popular list"),
            SizedBox(
              height: 10.h,
            ),
            _itemGridView(context),
          ],
        ),
      ),
    );
  }

  Widget _itemGridView(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: 150.w,
      height: 200.h,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40.0))),
      child: Stack(
        children: [
          Image.network(
            "https://thesaigontimes.vn/Uploads/Articles/67617/6177b_mission_impossible_4___int_poster.jpg",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.orange,
                                Colors.pinkAccent,
                              ],
                            )),
                        child: Center(
                          child: RichText(
                            text: const TextSpan(
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                              children: [
                                TextSpan(
                                  text: '9',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                TextSpan(
                                  text: '.8',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                const Positioned(
                    left: 0,
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "2008",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Nhiệm vụ bất khả thi",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //   height: double.maxFinite,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Container(
          //         width: 30,
          //         height: 30,
          //         decoration: const BoxDecoration(
          //             shape: BoxShape.circle,
          //             gradient: LinearGradient(
          //               begin: Alignment.topLeft,
          //               end: Alignment.bottomRight,
          //               colors: [
          //                 Colors.orange,
          //                 Colors.pinkAccent,
          //               ],
          //             )),
          //         child: Center(
          //           child: RichText(
          //             text: const TextSpan(
          //               style: TextStyle(fontSize: 12, color: Colors.white),
          //               children: [
          //                 TextSpan(
          //                   text: '9',
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 16),
          //                 ),
          //                 TextSpan(
          //                   text: '.8',
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             "2008",
          //             style: TextStyle(color: Colors.white),
          //           ),
          //           Text(
          //             "Nhiệm vụ bất khả thi",
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
