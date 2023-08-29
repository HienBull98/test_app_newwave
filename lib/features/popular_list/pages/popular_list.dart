import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularListPage extends StatefulWidget {
  const PopularListPage({Key? key}) : super(key: key);

  @override
  State<PopularListPage> createState() => _PopularListPageState();
}

class _PopularListPageState extends State<PopularListPage> {
  final List<int> numbers = List.generate(100, (index) => index + 1);
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Popular list",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: 18,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return _itemGridView(context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemGridView(BuildContext context) {
    return Container(
      height: 350.h,
      width: 130.w,
      // decoration: const BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(20)),
      // ),
      decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.greenAccent,
                blurRadius: 5.0,
                blurStyle: BlurStyle.outer)
          ]),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: [
            Image.network(
              "https://thesaigontimes.vn/Uploads/Articles/67617/6177b_mission_impossible_4___int_poster.jpg",
              width: double.maxFinite,
              height: 350.h,
              fit: BoxFit.fill,
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
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}
