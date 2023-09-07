import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item_model.dart';

final itemsProvider = Provider<List<Item>>((ref) {
  return [
    Item(
      id: 1,
      name: 'Cold Coffee',
      description: 'A Strong Drink',
      imageUrl:
          'https://neurosciencenews.com/files/2023/06/coffee-brain-caffeine-neuroscincces.jpg',
    ),
    Item(
      id: 2,
      name: 'Cappuccino Coffee',
      description: 'A Strong Drink',
      imageUrl:
          'https://media.cnn.com/api/v1/images/stellar/prod/150929101049-black-coffee-stock.jpg?q=x_3,y_1231,h_1684,w_2993,c_crop/h_720,w_1280',
    ),
    Item(
      id: 3,
      name: 'Lungo Coffee',
      description: 'A Strong Drink',
      imageUrl:
          'https://neurosciencenews.com/files/2023/06/coffee-brain-caffeine-neuroscincces.jpg',
    ),
    Item(
      id: 4,
      name: 'cold brew',
      description: 'A Strong Drink',
      imageUrl:
          'https://media.cnn.com/api/v1/images/stellar/prod/150929101049-black-coffee-stock.jpg?q=x_3,y_1231,h_1684,w_2993,c_crop/h_720,w_1280',
    ),
    Item(
      id: 5,
      name: 'latte Coffee',
      description: 'A Strong Drink',
      imageUrl:
          'https://neurosciencenews.com/files/2023/06/coffee-brain-caffeine-neuroscincces.jpg',
    ),
    Item(
      id: 6,
      name: 'Ristretto Coffee',
      description: 'A Strong Drink',
      imageUrl:
          'https://media.cnn.com/api/v1/images/stellar/prod/150929101049-black-coffee-stock.jpg?q=x_3,y_1231,h_1684,w_2993,c_crop/h_720,w_1280',
    ),
  ];
});
