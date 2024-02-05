import 'package:flutter/material.dart';
import 'package:wedding_gift/constants.dart';

class SearchBarItem extends StatelessWidget {
  const SearchBarItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: textFieldController.searchItem,
            decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon: IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  modelClassController
                      .searchUserByName(textFieldController.searchItem.text);
                },
                icon: const Icon(
                  Icons.search,
                  color: fontColor,
                ),
              ),
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
