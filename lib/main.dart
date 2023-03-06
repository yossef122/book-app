import 'package:bookly/core/bloc_observe/bloc_observe.dart';
import 'package:bookly/core/utils/Colors.dart';
import 'package:bookly/core/utils/Routing.dart';
import 'package:bookly/core/utils/WebService_locator.dart';
import 'package:bookly/features/Home/data/Repository/home_Repo_implementation.dart';
import 'package:bookly/features/Home/presentation/view_models/FeatureCubit/feature_cubit.dart';
import 'package:bookly/features/Home/presentation/view_models/bestSeller_book/best_seller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'features/Splash/presentation/view/Splash_View.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  runApp(const bookapp());
}

class bookapp extends StatelessWidget {
  const bookapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: const SplashView(),
    //   theme: ThemeData.dark().copyWith(
    //     scaffoldBackgroundColor: MyColors.mainColor,
    //     // textTheme: GoogleFonts.montserratSubrayadaTextTheme(ThemeData.dark().textTheme)
    //   ),
    //
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatureCubit(getIt.get<homeRepoImplementation>())
            ..getFeatureBooks(),
        ),
        BlocProvider(
          create: (context) =>
              BestSellerCubit(getIt.get<homeRepoImplementation>())
                ..getBestSellerBooks(),
        ),
      ],
      child: MaterialApp.router(
        routeInformationProvider: Routerbuild.router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: MyColors.mainColor,
        ),
        routeInformationParser: Routerbuild.router.routeInformationParser,
        routerDelegate: Routerbuild.router.routerDelegate,
      ),
    );
  }
}
