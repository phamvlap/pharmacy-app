import './../models/product.dart';

class ProductController {
  final List<Product> _products = [
    Product(
      name:
          'Aspirin 81mg Aspirin 81mg Aspirin 81mg Aspirin 81mg Aspirin 81mg Aspirin 81mg ',
      imageUrls: [
        'assets/drugs/drug1.jpg',
      ],
      description: 'Aspirin is used to reduce pain, fever, or inflammation.',
      category: ['Pain Reliever'],
      brand: 'Bayer',
      producer: 'Bayer AG',
      components: 'Aspirin (Acetylsalicylic Acid)',
      unit: 'Tablet',
      useGuide: 'Take one tablet every 4 to 6 hours as needed.',
      userTarget: 'Adults and children over 12 years',
      price: 5.99,
      salesOff: 0.1,
    ),
    Product(
      name: 'Ibuprofen',
      imageUrls: [
        'assets/drugs/drug2.jpg',
      ],
      description:
          'Ibuprofen is a nonsteroidal anti-inflammatory drug (NSAID).',
      category: ['Pain Reliever'],
      brand: 'Advil',
      producer: 'Pfizer',
      components: 'Ibuprofen',
      unit: 'Tablet',
      useGuide: 'Take one tablet every 6 to 8 hours as needed.',
      userTarget: 'Adults and children over 6 years',
      price: 6.99,
      salesOff: 0.15,
    ),
    Product(
      name: 'Cetirizine',
      imageUrls: [
        'assets/drugs/drug3.jpg',
      ],
      description:
          'Cetirizine is an antihistamine used to relieve allergy symptoms.',
      category: ['Antihistamine'],
      brand: 'Zyrtec',
      producer: 'Johnson & Johnson',
      components: 'Cetirizine Hydrochloride',
      unit: 'Tablet',
      useGuide: 'Take one tablet once daily.',
      userTarget: 'Adults and children over 6 years',
      price: 8.99,
      salesOff: 0.2,
    ),
  ];

  int get itemCount {
    return _products.length;
  }

  List<Product> get products {
    return [..._products];
  }
}
