import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldSearchBody extends StatelessWidget {
  const TextFieldSearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: outliendBorder(),
        focusedBorder: outliendBorder(),
        hintText: 'search',
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

outliendBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12));
}
