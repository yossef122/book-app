import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/features/Search/Presentation/View/Widgets/SearchViewList_body.dart';
import 'package:bookly/features/Search/Presentation/View/Widgets/TextFieldSearch_Body.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFieldSearchBody(),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:  Text(
              'Search results',
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // const SearchViewList()
        ],
      ),
    );
  }
}
