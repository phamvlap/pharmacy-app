import 'package:flutter/material.dart';

import '../../controllers/disease_controller.dart';
import '../../models/disease.dart';
import './home_diseases_tile.dart';

class HomeDiseasesGrid extends StatelessWidget {
  const HomeDiseasesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final diseaseController = DiseaseController();
    final List<Disease> diseases = diseaseController.diseases;

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: diseaseController.diseaseCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) => HomeDiseasesTile(diseases[index]),
    );
  }
}
