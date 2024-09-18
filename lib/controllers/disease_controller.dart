import '../models/disease.dart';

class DiseaseController {
  final List<Disease> _diseases = [
    Disease(
      title: 'Sốt xuất huyết Dengue',
      description:
          'Sốt xuất huyết là một bệnh truyền nhiễm cấp tính do virus Dengue gây ra',
      imageUrls: [
        'https://cdn.nhathuoclongchau.com.vn/unsafe/257x152/https://cms-prod.s3-sgn09.fptcloud.com/sot_xuat_huyet_0be606a33d.png'
      ],
    ),
    Disease(
      title: 'Ebola',
      description:
          'Ebola hay còn gọi là sốt xuất huyết Ebola là một bệnh truyền nhiễm',
      imageUrls: [
        'https://cdn.nhathuoclongchau.com.vn/unsafe/257x152/https://cms-prod.s3-sgn09.fptcloud.com/438_ebola_4203_626b_large_4345b84c27.jpg'
      ],
    ),
    Disease(
      title: 'Cúm A H3N2',
      description:
          'Virus cúm có vật chất di truyền là RNA, thuộc họ Orthomyxoviridae',
      imageUrls: [
        'https://cdn.nhathuoclongchau.com.vn/unsafe/257x152/https://cms-prod.s3-sgn09.fptcloud.com/cum_A_H3_N2_nguyen_nhan_trieu_chung_va_phong_ngua_hieu_qua_2_4d5f51962a.png',
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
