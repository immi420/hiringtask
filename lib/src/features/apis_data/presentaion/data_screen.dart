import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiringtask/src/features/apis_data/presentaion/widgets/data_card.dart';

import '../domain/data_usecase.dart';

class DataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Screen'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final data = ref.watch(dataProvider);

          return RefreshIndicator(
            onRefresh: () async => ref.refresh(dataProvider),
            child: data.when(
              data: (data) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return DataCard(item: item);
                  },
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
            ),
          );
        },
      ),
    );
  }
}
