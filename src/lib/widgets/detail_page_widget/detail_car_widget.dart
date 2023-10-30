import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../models/car.dart';
import 'section_title_widget.dart';

class DetailCarWidget extends StatelessWidget {
  const DetailCarWidget({super.key, required this.car});
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionTitleWidget(title: car.name, fontSize: 22),
            SectionTitleWidget(
                title: '\$${car.price.toString()}/day'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionTitleWidget(title: car.type),
            RatingWidget(rating: car.rating.toInt()),
          ],
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ReadMoreText(
            car.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10),
            trimLines: 3,
            moreStyle: const TextStyle(fontWeight: FontWeight.bold),
            lessStyle: const TextStyle(fontWeight: FontWeight.bold),
            trimMode: TrimMode.Line,
            trimCollapsedText: 'See more',
            trimExpandedText: ' See less',
          ),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitleWidget(title: 'Features'),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FeatureWidget(
                  icon: 'transmission',
                  name: car.transmissionType,
                ),
                const Spacer(flex: 1),
                FeatureWidget(
                  icon: 'speed',
                  name: '${car.maxSpeed}km/h',
                ),
                const Spacer(flex: 1),
                FeatureWidget(
                  icon: 'fuel',
                  name: '${car.fuelCapacity}L',
                ),
                const Spacer(flex: 1),
                FeatureWidget(
                  icon: 'car-door',
                  name: car.doorCount.toString(),
                ),
                const Spacer(flex: 1),
                FeatureWidget(
                  icon: 'car-seat',
                  name: car.seatCount.toString(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.rating,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(rating.toString(), style: const TextStyle(fontSize: 12)),
        const SizedBox(width: 4),
        for (var i = 0; i < 5; i++)
          (i < rating)
              ? const Icon(
                  Icons.star,
                  color: Colors.black,
                  size: 14,
                )
              : const Icon(
                  Icons.star,
                  color: Colors.black26,
                  size: 14,
                ),
      ],
    );
  }
}

class FeatureWidget extends StatelessWidget {
  const FeatureWidget({
    super.key,
    required this.icon,
    required this.name,
  });

  final String icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: Container(
        width: 62,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/$icon.png',
              width: 24,
            ),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
