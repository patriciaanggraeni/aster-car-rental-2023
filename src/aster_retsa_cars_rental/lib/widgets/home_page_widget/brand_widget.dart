import 'package:aster_retsa_cars_rental/bloc/brand_bloc/brand_bloc.dart';
import 'package:aster_retsa_cars_rental/bloc/brand_bloc/brand_event.dart';
import 'package:aster_retsa_cars_rental/bloc/brand_bloc/brand_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../../models/brand.dart';
import '../../pages/list_car_page.dart';

class CustomBrandWidget extends StatefulWidget {
  const CustomBrandWidget({super.key});

  @override
  State<CustomBrandWidget> createState() => _CustomBrandWidgetState();
}

class _CustomBrandWidgetState extends State<CustomBrandWidget> {
  final BrandBloc _brandBloc = BrandBloc();

  @override
  void initState() {
    _brandBloc.add(FetchBrandEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            ],
          ),
            BlocProvider(
              create: (context) => BrandBloc()..add(FetchBrandEvent()),
              child: BlocBuilder<BrandBloc, BrandState>(
                bloc: _brandBloc,
                builder: (contex, state) {
                  if (state is LoadedBandState) {
                    List<Brand> brands = state.brands;
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
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              Brand brand = brands[index];
                              return Card(
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xFF222525)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.network(
                                      height: 65,
                                      width: 65,
                                      brand.image,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }
                  else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}