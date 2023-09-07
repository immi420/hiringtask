import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final item;
  const DataCard({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          item['title'] ?? '',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(item['body'] ?? ''),
      ),
    );
  }
}
