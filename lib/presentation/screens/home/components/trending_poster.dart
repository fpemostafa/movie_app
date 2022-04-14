import 'package:flutter/material.dart';
import 'package:movie_app/constats/constants.dart';

import '../../../widgets/blurry_container.dart';

class TrendingPoster extends StatelessWidget {
  final List? movieList;
  const TrendingPoster({
    Key? key,
    required this.movieList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: movieList!.length - 80,
      controller:
          PageController(viewportFraction: .8, initialPage: 1, keepPage: true),
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 24),
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
                  image: NetworkImage(movieList![index]['image']),
                  placeholder:
                      const AssetImage('assets/images/loading_icon.gif'),
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
                            movieList![index]['imDbRating'].toString().isEmpty
                                ? 'NA'
                                : movieList![index]['imDbRating'].toString(),
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
              start: 10,
              child: Center(
                child: BlurryContainer(
                  width: 220,
                  child: Center(
                      child: Text(
                    movieList![index]['title'],
                    style: Theme.of(context).textTheme.headline6,
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
