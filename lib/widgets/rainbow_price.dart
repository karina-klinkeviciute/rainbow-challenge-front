import 'package:flutter/material.dart';
import 'package:rainbow_challenge/theme/headings.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

class RainbowPriceWidget extends StatelessWidget {
  final IconData? icon;
  final String? localIcon;
  final String price;
  final double priceHight;

  const RainbowPriceWidget({
    Key? key,
    this.icon,
    this.localIcon,
    required this.price,
    required this.priceHight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(price,
              style: ThemeHeadings.bigNumber.merge(TextStyle(
                  fontSize: priceHight, fontWeight: FontWeight.bold))),
          if (icon != null) Container(height: priceHight, child: Icon(icon)),
          if (localIcon != null)
            ImageLocalWidget(url: localIcon!, width: priceHight),
        ],
      ),
    );
  }
}
