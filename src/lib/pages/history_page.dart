import 'package:src/models/history_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: 'Hummer H3',
        price: '34757HH55SHD4755',
        imageUrl: 'src/assets/images/cars/hummer_h3/hummer_h3.png',
        rating: 'USD 5600'),
    Item(
        name: 'Aston Martin V12',
        price: '7FHW87458EFUHUS8',
        imageUrl:
            'src/assets/images/cars/aston_martin_v12/aston_martin_v12.png',
        rating: 'USD 1800'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Color.fromARGB(255, 34, 37, 37),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Menampilkan 2 item per baris
          childAspectRatio: 1.3, // Mengatur rasio lebar-tinggi item
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(
                    25), // Tambahkan padding pada keseluruhan Card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'productImage${item.name}',
                      child: AspectRatio(
                        aspectRatio:
                            2, // Rasio lebar-tinggi 1:1 untuk ukuran yang sama
                        child: Image.asset(item.imageUrl, fit: BoxFit.fitWidth),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Agar rating berada di sebelah kanan
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 1), // Padding di atas teks "name"
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              item.rating.toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 34, 37, 37),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        item.price.toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 148, 148, 148),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      '20th March 2023  =>  28th March 2023',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 34, 37, 37),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 34, 37, 37),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
