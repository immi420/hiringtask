import 'package:flutter/material.dart';

import '../../domain/item_model.dart';

class CustomCard extends StatelessWidget {
  final Item item;
  const CustomCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(item.imageUrl), fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            item.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(item.description),
        ],
      ),
    );
  }
}
