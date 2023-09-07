import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../apis_data/presentaion/data_screen.dart';
import '../domain/item_provider.dart';
import 'widgets/custom_card.dart'; // Import the domain provider

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsProvider); // Consume the domain provider

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DataScreen())),
              icon: Icon(Icons.data_exploration_sharp))
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return CustomCard(
            item: item,
          );
        },
      ),
    );
  }
}
