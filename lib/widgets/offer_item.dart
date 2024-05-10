import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/offer.dart';

class OfferItem extends StatelessWidget {
  OfferItem({super.key, required this.offer});

  final Offer offer;

  final Map<int, String> offerImages = {
    1: "font/images/photo1.png",
    2: "font/images/photo2.png",
    3: "font/images/photo3.png",
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: 160,
        child: Card(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (offerImages.containsKey(offer.id)) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: Image.asset(
                      offerImages[offer.id]!,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
                const SizedBox(
                  height: 5,
                ),
                Text(
                  offer.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "SF_Pro_display",
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  offer.town,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("font/icons/plane.svg"),
                    Text(
                      " от ${offer.price.toString()}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.currency_ruble,
                      color: Colors.white,
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}