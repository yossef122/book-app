import 'package:bookly/features/Home/presentation/view/widget/Custom_appbar.dart';
import 'package:bookly/features/Home/presentation/view/widget/FeatureCustomListview.dart';
import 'package:bookly/features/Home/presentation/view/widget/BestSeller_Listview.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/Styles.dart';

class HomeViewbody extends StatelessWidget {
  const HomeViewbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: /*const*/ [
              const CustomAppbar(),
              const FeatureCustomListview(),
              Container(
                padding: const EdgeInsets.only(left: 25, top: 40),
                child: const Text(
                  'best selling',
                  style: Styles.textStyle18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        //هنعمل الفيل ريميننج عشان منعملش الshrimkwrap
        //الي هو وظيفتو انه هيبني كل الليست فيو وهياخد الهايت الي هتملاه ودا بيقل من البيرفورمنس بتع  الجهاز
        /*const SliverFillRemaining(
          child: BestSellerListview(),
        )*/
        const SliverToBoxAdapter(
          child: BestSellerListview(),
        )
      ],

    );
  }
}
