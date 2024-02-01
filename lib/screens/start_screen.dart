import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_app/common_widget/button_widget.dart';
import 'package:project_app/constant/list_data_start.dart';
import 'package:project_app/screens/screen_auth/auth_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});
  @override
  State<StatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int activeIndex = 0;
  Widget buildSlideImage(Map<String, dynamic> data) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Image(
                image: AssetImage('assets/images/${data['image']}'),
                fit: BoxFit.cover,
              )),
          Text(data['title1'].toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2),
          Text(
            data['title2'].toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: AspectRatio(
        aspectRatio: w / h,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: CarouselSlider.builder(
                  itemCount: dataStart.length,
                  itemBuilder: (context, index, realIndex) =>
                      buildSlideImage(dataStart[index]),
                  options: CarouselOptions(
                    height: double.infinity,
                    initialPage: 0,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  )),
            ),
            if (activeIndex == 2)
              ButtonCustom(
                  title: 'Start now',
                  fn: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ));
                  }),
            Expanded(
                child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex, count: dataStart.length))
          ],
        ),
      ),
    );
  }
}
