import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/constats/constants.dart';

import '../../../widgets/blurry_container.dart';

class TrendingPoster extends StatefulWidget {
  final List? movieList;
  const TrendingPoster({
    Key? key,
    required this.movieList,
  }) : super(key: key);

  @override
  State<TrendingPoster> createState() => _TrendingPosterState();
}

class _TrendingPosterState extends State<TrendingPoster> {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    pageController =
        PageController(viewportFraction: .75, initialPage: 0, keepPage: true);
    Timer(const Duration(microseconds: 100), ()=>pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  bool onTapHandler = false;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: widget.movieList!.length,
        controller: pageController,
        itemBuilder: (_, index) => imageSlider(index));
  }

  imageSlider(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          value = (1 - value.abs() * 0.25).clamp(0, 1);
        }
        return Center(
          child: SizedBox(
            width: Curves.easeInOut.transform(value) * 258,
            height: Curves.easeInOut.transform(value) * 336,
            child: widget,
          ),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: defualtBorderRadius,
            child: Container(
              height: 336,
              width: 258,
              decoration: const BoxDecoration(
                borderRadius: defualtBorderRadius,
              ),
              // TODO FadeIn image with loading circle
              //progress indecator and crop the edigs with rounded bordeer
              child: FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.movieList![index]['image']),
                placeholder: const AssetImage('assets/images/loading_icon.gif'),
              ),
            ),
          ),
          Container(
            height: 336,
            width: 258,
            decoration: BoxDecoration(
              borderRadius: defualtBorderRadius,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF000000).withOpacity(.15),
                  const Color(0xFF000000).withOpacity(0),
                  const Color(0xFF000000).withOpacity(.15),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          PositionedDirectional(
            top: 16,
            end: 16,
            child: BlurryContainer(
              borderRadius: BorderRadius.circular(10),
              width: 68,
              height: 46,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'IMDB',
                      style: TextStyle(fontSize: 8),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/star.png'),
                        const SizedBox(width: 10),
                        Text(
                          widget.movieList![index]['imDbRating']
                                  .toString()
                                  .isEmpty
                              ? 'NA'
                              : widget.movieList![index]['imDbRating']
                                  .toString(),
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          PositionedDirectional(
            bottom: 20,
            // pairant width 258 and blurry banner width 220
            // so 258-220 = 38 => 38/2 = 19
            start: 19,
            child: BlurryContainer(
              width: 220,
              child: Center(
                child: Text(
                  widget.movieList![index]['title'],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
