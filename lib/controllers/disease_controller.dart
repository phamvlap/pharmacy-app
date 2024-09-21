import './../models/disease.dart';

class DiseaseController {
  final List<Disease> _diseases = [
    Disease(
      title: 'Sốt xuất huyết Dengue',
      description:
          'Sốt xuất huyết là một bệnh truyền nhiễm cấp tính do virus Dengue gây ra',
      imageUrls: [
        'assets/diseases/sot_xuat_huyet.jpeg',
      ],
    ),
    Disease(
      title: 'Ebola',
      description:
          'Ebola hay còn gọi là sốt xuất huyết Ebola là một bệnh truyền nhiễm',
      imageUrls: [
        'assets/diseases/ebola.jpeg',
      ],
    ),
    Disease(
      title: 'Cúm A H3N2',
      description:
          'Virus cúm có vật chất di truyền là RNA, thuộc họ Orthomyxoviridae',
      imageUrls: [
        'assets/diseases/cum_h3n2.jpeg',
      ],
    ),
  ];

  int get diseaseCount {
    return _diseases.length;
  }

  List<Disease> get diseases {
    return [..._diseases];
  }
}
