import 'package:flutter_test_task_2/shop/data/models/salad.dart';

class Data {
  static final List<Salad> _saladList = [
    Salad(
      id: 0,
      name: 'Honey lime combo',
      ordersCount: 10,
      price: 2000,
      rating: 4.7,
      releaseDate: DateTime.now().subtract(const Duration(days: 90)),
      lastOrdered: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Salad(
      id: 1,
      name: 'Berry mango combo',
      ordersCount: 32,
      price: 2000,
      rating: 4.8,
      releaseDate: DateTime.now().subtract(const Duration(days: 90)),
      lastOrdered: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Salad(
      id: 2,
      name: 'Quinoa fruit salad',
      price: 3000,
      rating: 4.6,
      ordersCount: 120,
      releaseDate: DateTime.now().subtract(const Duration(days: 60)),
      lastOrdered: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Salad(
      id: 3,
      name: 'Tropical fruit salad',
      price: 7000,
      rating: 4.4,
      ordersCount: 90,
      releaseDate: DateTime.now().subtract(const Duration(days: 10)),
      lastOrdered: DateTime.now().subtract(const Duration(days: 4)),
    ),
    Salad(
      id: 4,
      name: 'Melon fruit salad',
      price: 12000,
      rating: 4.9,
      ordersCount: 180,
      releaseDate: DateTime.now().subtract(const Duration(days: 90)),
      lastOrdered: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Salad(
      id: 5,
      name: 'Banana Salad',
      price: 9000,
      rating: 4.5,
      ordersCount: 100,
      releaseDate: DateTime.now().subtract(const Duration(days: 20)),
      lastOrdered: DateTime.now(),
    ),
    Salad(
      id: 6,
      name: 'Apple Salad',
      price: 11000,
      rating: 4.7,
      ordersCount: 85,
      releaseDate: DateTime.now().subtract(const Duration(days: 25)),
      lastOrdered: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Salad(
      id: 7,
      name: 'Tomato Salad',
      price: 6000,
      rating: 4.3,
      ordersCount: 60,
      releaseDate: DateTime.now().subtract(const Duration(days: 120)),
      lastOrdered: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Salad(
      id: 8,
      name: 'Kiwi Salad',
      price: 5000,
      rating: 4.2,
      ordersCount: 110,
      releaseDate: DateTime.now().subtract(const Duration(days: 15)),
      lastOrdered: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Salad(
      id: 9,
      name: 'Multi Salad',
      price: 6800,
      rating: 4.0,
      ordersCount: 70,
      releaseDate: DateTime.now().subtract(const Duration(days: 40)),
      lastOrdered: DateTime.now().subtract(const Duration(days: 6)),
    ),
  ];

  static Future<List<Salad>> mockFetch() async {
    await Future.delayed(const Duration(seconds: 2));
    return Data._saladList;
  }

  static final List<String> _imagesUrl = [
    'https://www.figma.com/file/LbAl0gnpNXHXhfTHT0PQ2z/image/ee16823da03b881bf4ce051b2a64b06284deadd7',
    'https://www.figma.com/file/LbAl0gnpNXHXhfTHT0PQ2z/image/b585f503dd236cf04a42d95381c96cc2b592320b',
    'https://www.figma.com/file/LbAl0gnpNXHXhfTHT0PQ2z/image/f3964b02293c08dbccc8996d32beb6f05e420119',
    'https://www.figma.com/file/LbAl0gnpNXHXhfTHT0PQ2z/image/c1bfb8f7a2aeef0262bb51afeaba8405f6cb35ea',
    'https://www.figma.com/file/LbAl0gnpNXHXhfTHT0PQ2z/image/1965b0539f8fb0fc8a196f5bb8c07809cbbd3e78'
  ];

  static String getSrcById(int id) {
    if (_imagesUrl.length <= id) return _imagesUrl.last;

    return _imagesUrl.elementAt(id);
  }
}
