import 'package:flutter/material.dart';

import 'section_title_widget.dart';

class PickupLocationWidget extends StatelessWidget {
  const PickupLocationWidget({
    super.key,
    required this.onPressed,
    required this.location,
  });

  final VoidCallback onPressed;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget(title: 'Pickup Location'),
        const SizedBox(
          height: 6,
        ),
        Hero(
          tag: 'location',
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(25, 25, 25, 1),
              ),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 9)),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              elevation: MaterialStateProperty.all(0),
            ),
            onPressed: onPressed,
            child: SizedBox(
              height: 37,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.my_location_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      SizedBox(
                        width: 264,
                        child: Text(
                          location == '' ? 'Enter Location' : location,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 24,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
