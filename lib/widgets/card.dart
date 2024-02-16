import 'package:flutter/material.dart';

class CardContentIcon extends StatelessWidget {
  final IconData iconData;
  final String? title;
  const CardContentIcon({
    super.key,
    required this.iconData,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          iconData,
          size: 70,
        ),
        if (title != null)
          Text(
            title!,
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}

class CardContentNumber extends StatelessWidget {
  final String? title;
  final String value;
  final void Function() plusAction;
  final void Function() minusAction;
  const CardContentNumber(
      {super.key,
      this.title,
      required this.value,
      required this.plusAction,
      required this.minusAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (title != null) Text(title!),
        Text(value, style: Theme.of(context).textTheme.bodyLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularIconButton(
              iconData: Icons.remove,
              action: minusAction,
            ),
            CircularIconButton(
              iconData: Icons.add,
              action: plusAction,
            ),
          ],
        )
      ],
    );
  }
}

class CircularIconButton extends StatelessWidget {
  final IconData iconData;
  final void Function() action;
  const CircularIconButton({
    super.key,
    required this.iconData,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: action,
      fillColor: Colors.black12,
      shape: CircleBorder(),
      constraints: BoxConstraints(),
      padding: EdgeInsets.all(15),
      child: Icon(
        iconData,
        color: Theme.of(context).textTheme.bodyMedium!.color,
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final void Function()? touchAction;

  const CustomCard({
    super.key,
    this.child,
    this.backgroundColor,
    this.touchAction,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: touchAction,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroundColor,
              ),
              child: child),
        ),
      ),
    );
  }
}
