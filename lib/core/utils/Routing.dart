import 'package:bookly/features/Home/data/Model/BookModel.dart';
import 'package:bookly/features/Home/presentation/view/Bookdetails_view.dart';
import 'package:bookly/features/Home/presentation/view/Home.dart';
import 'package:bookly/features/Search/Presentation/View/SearchView.dart';
import 'package:bookly/features/Splash/presentation/view/Splash_View.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class Routerbuild {
// GoRouter configuration
static var kHomeScreen='/homeScreen';
static var kBookDetailsScreen='/BookDetails';
static var kSearchScreen='/Search';

static final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: kHomeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
    ),
    GoRoute(
      path: kBookDetailsScreen,
      builder: (BuildContext context, GoRouterState state) {
        return  BookDetailsView(bookmodel: state.extra as Bookmodel,);
      },
    ),
    GoRoute(
      path: kSearchScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SearchView();
      },
    ),

  ],
);

}
