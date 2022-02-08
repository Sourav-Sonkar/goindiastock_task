import 'package:flutter/material.dart';
import 'package:goindiastocks_task/utils/extensions/widget_extensions.dart';

class ButtonStructure extends StatelessWidget {
  const ButtonStructure({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.color,
  }) : super(key: key);

  final bool isSelected;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? Border.all(
                color: Colors.black,
                width: 2,
              )
            : null,
      ),
      width: double.infinity,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: !isSelected ? Colors.white : Colors.black,
            ),
      ).wrapCenter(),
    );
  }
}
