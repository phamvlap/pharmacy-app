import '../models/models.dart';

class ProductController {
  final List<Product> _products = [
    Product(
      id: 'p1',
      name: "Thuốc giảm đau Paracetamol 500mg - Paracetamol 500mg - vỉ 10 viên",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Thuốc giảm đau, hạ sốt dùng cho các trường hợp đau đầu, đau nhức cơ thể và sốt nhẹ.",
      category: ["Giảm đau hạ sốt"],
      brand: "Paracetamol",
      producer: "Công ty Dược Hậu Giang",
      components: "Paracetamol 500mg",
      unit: "vỉ",
      useGuide: "Uống 1-2 viên mỗi 4-6 giờ, không quá 8 viên/ngày.",
      userTarget: "Người lớn và trẻ em trên 6 tuổi",
      price: 30000,
      salesOff: 0.15,
    ),
    Product(
      id: 'p2',
      name: "Vitamin C 500mg",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Viên uống bổ sung Vitamin C giúp tăng cường sức đề kháng, hỗ trợ hệ miễn dịch và chống oxy hóa.",
      category: ["Bổ sung Vitamin"],
      brand: "Vitamin C",
      producer: "Dược Phẩm Traphaco",
      components: "Vitamin C 500mg",
      unit: "hộp",
      useGuide: "Uống 1 viên/ngày sau khi ăn.",
      userTarget: "Người lớn và trẻ em trên 12 tuổi",
      price: 50000,
      salesOff: 0.1,
    ),
    Product(
      id: 'p3',
      name: "Thuốc trị đau dạ dày Omeprazole",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Thuốc điều trị viêm loét dạ dày, giảm tiết acid dạ dày và ngăn ngừa loét tá tràng.",
      category: ["Thuốc dạ dày"],
      brand: "Omeprazole",
      producer: "Công ty Dược phẩm Imexpharm",
      components: "Omeprazole 20mg",
      unit: "vỉ",
      useGuide: "Uống 1 viên trước bữa ăn sáng, sử dụng liên tục trong 2 tuần.",
      userTarget: "Người lớn",
      price: 45000,
      salesOff: 0.2,
    ),
    Product(
      id: 'p4',
      name: "Siro ho Prospan",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Siro ho thảo dược chiết xuất từ lá thường xuân giúp làm dịu cổ họng và giảm ho hiệu quả.",
      category: ["Thuốc ho"],
      brand: "Prospan",
      producer: "Engelhard Arzneimittel",
      components: "Chiết xuất lá thường xuân",
      unit: "chai",
      useGuide: "Uống 5ml x 2 lần/ngày sau bữa ăn.",
      userTarget: "Trẻ em và người lớn",
      price: 80000,
      salesOff: 0.15,
    ),
    Product(
      id: 'p5',
      name: "Viên sủi bổ sung canxi Calcium Sandoz",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Viên sủi bổ sung canxi cho người thiếu hụt canxi, đặc biệt là phụ nữ mang thai và người lớn tuổi.",
      category: ["Bổ sung Canxi"],
      brand: "Calcium Sandoz",
      producer: "Sanofi",
      components: "Canxi 500mg",
      unit: "tuýp",
      useGuide: "Hòa tan 1 viên vào 200ml nước, uống 1 lần/ngày.",
      userTarget: "Người lớn và phụ nữ",
      price: 60000,
      salesOff: 0.1,
    ),
    Product(
      id: 'p6',
      name: "Thuốc giảm đau Paracetamol",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Thuốc giảm đau và hạ sốt cho các trường hợp đau đầu, đau nhức cơ thể, sốt do cảm cúm.",
      category: ["Giảm đau hạ sốt"],
      brand: "Paracetamol",
      producer: "Dược Hậu Giang",
      components: "Paracetamol 500mg",
      unit: "vỉ",
      useGuide: "Uống 1-2 viên mỗi 4-6 giờ, không quá 8 viên/ngày.",
      userTarget: "Người lớn và trẻ em trên 6 tuổi",
      price: 30000,
    ),
    Product(
      id: 'p7',
      name: "Vitamin C 500mg",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Viên uống bổ sung Vitamin C, giúp tăng cường sức đề kháng, hỗ trợ hệ miễn dịch.",
      category: ["Bổ sung Vitamin"],
      brand: "Vitamin C",
      producer: "Dược phẩm Traphaco",
      components: "Vitamin C 500mg",
      unit: "hộp",
      useGuide: "Uống 1 viên/ngày sau khi ăn.",
      userTarget: "Người lớn và trẻ em trên 12 tuổi",
      price: 50000,
    ),
    Product(
      id: 'p8',
      name: "Thuốc trị đau dạ dày Omeprazole",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Thuốc điều trị viêm loét dạ dày, giảm tiết acid, giúp ngăn ngừa loét dạ dày, tá tràng.",
      category: ["Dạ dày"],
      brand: "Omeprazole",
      producer: "Dược phẩm Imexpharm",
      components: "Omeprazole 20mg",
      unit: "vỉ",
      useGuide: "Uống 1 viên trước bữa ăn sáng, sử dụng liên tục trong 2 tuần.",
      userTarget: "Người lớn",
      price: 45000,
    ),
    Product(
      id: 'p9',
      name: "Siro ho Prospan",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Siro ho thảo dược chiết xuất từ lá thường xuân, giảm ho, dịu cổ họng hiệu quả.",
      category: ["Thuốc ho"],
      brand: "Prospan",
      producer: "Engelhard Arzneimittel",
      components: "Chiết xuất lá thường xuân",
      unit: "chai",
      useGuide: "Uống 5ml x 2 lần/ngày sau bữa ăn.",
      userTarget: "Trẻ em và người lớn",
      price: 80000,
    ),
    Product(
      id: 'p10',
      name: "Viên sủi bổ sung canxi Calcium Sandoz",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Viên sủi bổ sung canxi cho người thiếu hụt canxi, phụ nữ mang thai và người lớn tuổi.",
      category: ["Bổ sung Canxi"],
      brand: "Calcium Sandoz",
      producer: "Sanofi",
      components: "Canxi 500mg",
      unit: "tuýp",
      useGuide: "Hòa tan 1 viên vào 200ml nước, uống 1 lần/ngày.",
      userTarget: "Người lớn và phụ nữ mang thai",
      price: 90000,
    ),
    Product(
      id: 'p11',
      name: "Thuốc kháng sinh Amoxicillin",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Thuốc kháng sinh phổ rộng điều trị các nhiễm trùng do vi khuẩn như viêm phổi, viêm tai giữa.",
      category: ["Kháng sinh"],
      brand: "Amoxicillin",
      producer: "Dược phẩm Pymepharco",
      components: "Amoxicillin 500mg",
      unit: "vỉ",
      useGuide: "Uống 1 viên mỗi 8 giờ trong 7-10 ngày.",
      userTarget: "Người lớn và trẻ em trên 6 tuổi",
      price: 60000,
    ),
    Product(
      id: 'p12',
      name: "Thuốc nhỏ mắt Visine",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Dung dịch nhỏ mắt giúp làm dịu và giảm kích ứng mắt do khói bụi, khô mắt.",
      category: ["Thuốc nhỏ mắt"],
      brand: "Visine",
      producer: "Johnson & Johnson",
      components: "Tetrahydrozoline HCl 0.05%",
      unit: "chai",
      useGuide: "Nhỏ 1-2 giọt mỗi 4 giờ khi cần thiết.",
      userTarget: "Người lớn và trẻ em trên 12 tuổi",
      price: 70000,
    ),
    Product(
      id: 'p13',
      name: "Thuốc xịt mũi Otrivin",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Thuốc xịt mũi điều trị nghẹt mũi do viêm xoang, cảm cúm, giúp thông mũi nhanh chóng.",
      category: ["Thuốc xịt mũi"],
      brand: "Otrivin",
      producer: "Novartis",
      components: "Xylometazoline HCl 0.1%",
      unit: "chai",
      useGuide: "Xịt 1 lần mỗi bên mũi 2-3 lần/ngày.",
      userTarget: "Người lớn và trẻ em trên 6 tuổi",
      price: 55000,
    ),
    Product(
      id: 'p14',
      name: "Thuốc trị viêm họng Strepsils",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Viên ngậm trị viêm họng giúp giảm đau họng, kháng khuẩn, làm dịu cổ họng hiệu quả.",
      category: ["Viêm họng"],
      brand: "Strepsils",
      producer: "Reckitt Benckiser",
      components: "Amylmetacresol, Dichlorobenzyl Alcohol",
      unit: "hộp",
      useGuide: "Ngậm 1 viên mỗi 2-3 giờ, không quá 8 viên/ngày.",
      userTarget: "Người lớn và trẻ em trên 6 tuổi",
      price: 40000,
    ),
    Product(
      id: 'p15',
      name: "Thuốc bổ gan Hepalyse",
      imageUrls: [
        'assets/drugs/drug1.jpg',
        'assets/drugs/drug2.jpg',
        'assets/drugs/drug3.jpg',
        'assets/drugs/drug4.jpg',
      ],
      description:
          "Viên uống bổ gan giúp thải độc gan, bảo vệ gan, hỗ trợ chức năng gan cho người suy gan.",
      category: ["Bổ gan"],
      brand: "Hepalyse",
      producer: "Zeria Pharmaceutical",
      components: "Acid amin, Chiết xuất từ gan bò",
      unit: "hộp",
      useGuide: "Uống 1 viên mỗi ngày sau bữa ăn.",
      userTarget: "Người lớn",
      price: 180000,
    ),
  ];

  int get itemCount {
    return _products.length;
  }

  List<Product> get products {
    return [..._products];
  }

  Product findById(String id) {
    return _products.firstWhere((item) => item.id == id);
  }

  Map<String, dynamic> toMap(Product product) {
    return {
      "id": product.id,
      "name": product.name,
      "imageUrls": product.imageUrls,
      "description": product.description,
      "category": product.category,
      "brand": product.brand,
      "producer": product.producer,
      "components": product.components,
      "unit": product.unit,
      "useGuide": product.useGuide,
      "userTarget": product.userTarget,
      "price": product.price,
      "salesOff": product.salesOff,
    };
  }
}
