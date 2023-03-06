import 'package:bookly/core/Widget/Error_Widget_handler.dart';
import 'package:bookly/core/Widget/LoadingState_Widget.dart';
import 'package:bookly/core/utils/Routing.dart';
import 'package:bookly/features/Home/presentation/view/widget/customBookImage_item.dart';
import 'package:bookly/features/Home/presentation/view_models/FeatureCubit/feature_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatureCustomListview extends StatelessWidget {
  const FeatureCustomListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureCubit, FeatureState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = FeatureCubit.get(context).FeatureBooks;
        if (state is GetFeatureBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.separated(
                // padding: const EdgeInsets.only(left: 20,right: 20, bottom: 20),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(Routerbuild.kBookDetailsScreen,extra: cubit![index]);

                  },
                  child: customBookImage_item(
                        imageLink:
                            cubit?[index].volumeInfo?.imageLinks?.smallThumbnail,
                      ),
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: cubit!.length),
          );
        } else if (state is GetFeatureBookFailure) {
          return errorWidgetHandler(
            error: state.error,
          );
        } else {
          return const LoadingStateWidget();
        }
      },
    );
  }
}
