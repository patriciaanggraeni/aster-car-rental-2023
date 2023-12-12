import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../../models/brand.dart';
import '../../pages/list_car_page.dart';

class CustomBrandWidget extends StatelessWidget {
  const CustomBrandWidget({super.key, required this.brand});
  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Brand",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "See more",
                style: GoogleFonts.poppins(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        ctx: context,
                        child: const ListCarPage(),
                        inheritTheme: true,
                        duration: const Duration(milliseconds: 500),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFF222525)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.network(brand.image),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ]),
      ),
    );
  }
}

/**
 * SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              itemBuilder: (context, index) {
                Brand brand = brands[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        ctx: context,
                        child: const ListCarPage(),
                        inheritTheme: true,
                        duration: const Duration(milliseconds: 500),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFF222525)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/images/brands/${brand.image}",
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
 */