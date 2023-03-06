import 'package:bookly/core/Widget/Error_Widget_handler.dart';
import 'package:bookly/core/Widget/LoadingState_Widget.dart';
import 'package:bookly/features/Home/presentation/view/widget/Best_Seller_Listview_Item.dart';
import 'package:bookly/features/Home/presentation/view_models/bestSeller_book/best_seller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        var cubit = BestSellerCubit.get(context).BestSellerbooks;
        if (state is GetBestSellerBookSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => BestSellerListviewItem(
                      bookModel: cubit![index],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: cubit!.length),
          );
        } else if (state is GetBestSellerBookFailure) {
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
