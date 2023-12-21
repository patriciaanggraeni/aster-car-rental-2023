import 'package:aster_retsa_cars_rental/bloc/history_bloc/history_bloc.dart';
import 'package:aster_retsa_cars_rental/bloc/history_bloc/history_event.dart';
import 'package:aster_retsa_cars_rental/bloc/history_bloc/history_state.dart';
import 'package:aster_retsa_cars_rental/models/car.dart';
import 'package:aster_retsa_cars_rental/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc(Repository())..add(LoadHistory()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('History'),
        ),
        body: BlocBuilder<HistoryBloc, HistoryState>(builder: (context, state) {
          if (state is HistoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HistoryLoaded) {
            if (state.history.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/no_data.svg',
                      width: 160,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Your history is empty!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: state.history.length,
              itemBuilder: (context, index) {
                final item = state.history[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: FutureBuilder(
                      future: item.car,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text("Error: ${snapshot.error}"));
                        } else if (snapshot.hasData) {
                          Car car = snapshot.data!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: 'productImage${car.name}',
                                child: AspectRatio(
                                  aspectRatio: 2,
                                  child: Image.network(car.imageCover,
                                      fit: BoxFit.fitWidth),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 1),
                                    child: Text(
                                      car.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        car.rating.toString(),
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 34, 37, 37),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  item.price.toString(),
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 148, 148, 148),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Text(
                                item.date,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 34, 37, 37),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                              child: Text("Waiting for car details..."));
                        }
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is HistoryError) {
            return const Text('Error loading history');
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
