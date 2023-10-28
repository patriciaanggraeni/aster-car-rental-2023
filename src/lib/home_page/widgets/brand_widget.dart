import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/home_page/model/Brand.dart';

class CustomBrandWidget extends StatelessWidget {
  const CustomBrandWidget({super.key, required this.brands});
  final List<Brand> brands;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
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
              ],
            ),
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              itemBuilder: (context, index) {
                Brand brand = brands[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
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
                          brand.image,
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
