import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/cubit/movie_cubit.dart';
import 'package:movie_app/constats/constants.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../widgets/blurry_container.dart';
import 'components/trending_poster.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieCubit.get(context).getAllMovies();

    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: _buildAppBar(textTheme),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMianPoster(context),
            const SizedBox(height: 36),
            Text('Trending', style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 24),
            Flexible(
              child: BlocBuilder<MovieCubit, MovieStates>(
                builder: (context, state) {
                  if (state is MovieLoadedState) {
                    return TrendingPoster(movieList: (state).movies);
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Home.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Icon.png'),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Group 253.png'),
            label: 'User',
          ),
        ],
      ),
    );
  }

  Stack buildMianPoster(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 191,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: defualtBorderRadius,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/boster_image.png'),
            ),
          ),
        ),
        Container(
          height: 191,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: defualtBorderRadius,
            gradient: LinearGradient(
              colors: [
                const Color(0xFF000000).withOpacity(0),
                const Color(0xFF000000).withOpacity(.15),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        PositionedDirectional(
          start: 12,
          bottom: 8,
          child: BlurryContainer(
            width: 212,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 44,
                  height: 44,
                  child: Image.asset('assets/images/paly_icon.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue Watching',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ready Player one',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  AppBar _buildAppBar(TextTheme textTheme) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsetsDirectional.only(start: 10),
        child: Row(
          children: [
            GradientText(
              'Stream',
              style: textTheme.headline5,
              colors: bgColor,
            ),
            Text(
              ' Everywhere',
              style: textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
