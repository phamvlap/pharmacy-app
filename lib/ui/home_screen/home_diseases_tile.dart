import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

class HomeDiseasesTile extends StatelessWidget {
  final Disease disease;

  const HomeDiseasesTile(this.disease, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 0.1,
            offset: const Offset(0, 0),
          ),
        ],
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
                    style: TextStyle(
                      color: AppColors.greyColor,
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
                  style: TextStyle(
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
