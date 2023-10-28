import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSliderWidget extends StatefulWidget {
  const ImageSliderWidget({super.key, required this.images});

  final List<String> images;

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<ImageSliderWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> sliders = widget.images
        .map((item) => Image.asset('assets/images/$item'))
        .toList();

    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            items: sliders,
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _current = index;
                  },
                );
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map(
            (entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 28,
                  height: 8,
                  margin: const EdgeInsets.only(
                    bottom: 36,
                    left: 6,
                    right: 6,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.black
                              : Colors.white)
                          .withOpacity(_current == entry.key ? 1 : 0)),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
