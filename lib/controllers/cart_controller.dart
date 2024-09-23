import '../models/models.dart';

class CartController {
  final List<CartItem> _cartItems = [
    CartItem(
      product: Product(
        id: 'p1',
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
      quantity: 1,
    ),
    CartItem(
      product: Product(
        id: 'p2',
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
      quantity: 1,
    ),
    CartItem(
      product: Product(
        id: 'p3',
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
      quantity: 1,
    ),
    CartItem(
      product: Product(
        id: 'p4',
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
      quantity: 1,
    ),
    CartItem(
      product: Product(
        id: 'p5',
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
      quantity: 1,
    ),
    CartItem(
      product: Product(
        id: 'p6',
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
      quantity: 1,
    ),
    CartItem(
      product: Product(
        id: 'p7',
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
      quantity: 1,
    ),
    CartItem(
      product: Product(
        id: 'p8',
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
      quantity: 1,
    ),
    CartItem(
      product: Product(
        id: 'p9',
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
      quantity: 1,
    ),
    CartItem(
      product: Product(
        id: 'p10',
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
      quantity: 1,
    ),
  ];

  int get itemCount {
    return _cartItems.length;
  }

  List<CartItem> get items {
    return [..._cartItems];
  }

  double get totalAmount {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  double get discountAmount {
    double discount = 0.0;
    for (var item in _cartItems) {
      double salesOffRate = item.product.salesOff ?? 0.0;
      discount += item.product.price * item.quantity * salesOffRate;
    }
    return discount;
  }
}
