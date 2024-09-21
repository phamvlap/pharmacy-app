import 'package:flutter/material.dart';

import '../../models/disease.dart';
import '../../utils/app_theme.dart';

class HomeDiseasesTile extends StatelessWidget {
  final Disease disease;

  const HomeDiseasesTile(this.disease, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.grey[600]!,
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: <Widget>[
          Image.asset(
            disease.imageUrls[0],
            fit: BoxFit.cover,
            height: 120,
          ),
          const SizedBox(height: 6.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    disease.title,
                    style: const TextStyle(
                      fontSize: AppFontSizes.textMedium,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  disease.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
