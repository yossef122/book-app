import 'package:bookly/core/utils/Routing.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10, top: 40, bottom: 20),
      child: Row(
        children: [
          Image.asset(
            Assetsdata.logo,
            height: 18,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(Routerbuild.kSearchScreen);
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 18,
              ))
        ],
      ),
    );
  }
}
