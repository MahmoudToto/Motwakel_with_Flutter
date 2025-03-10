import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String? assetImage;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color color;
  final double size;

  const CustomIconButton({
    Key? key,
    this.assetImage,
    this.icon,
    required this.onPressed,
    this.color = Colors.black,
    this.size = 30.0,
  }) : assert(assetImage != null || icon != null, 'Either assetImage or icon must be provided'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: assetImage != null
          ? Image.asset(assetImage!, width: size, height: size)
          : Icon(icon, color: color, size: size),
      onPressed: onPressed,
    );
  }
}